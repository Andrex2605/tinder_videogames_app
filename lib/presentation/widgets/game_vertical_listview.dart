import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';
import 'package:tinder_videogames_app/main.dart';

class GameVerticalListView extends StatefulWidget {
  final List<Game> games;
  final VoidCallback? loadNextPage;

  const GameVerticalListView({
    super.key,
    required this.games,
    this.loadNextPage,
  });

  @override
  State<GameVerticalListView> createState() => _GameVerticalListViewState();
}

class _GameVerticalListViewState extends State<GameVerticalListView> {
  final Dio _dio = Dio(); // Instancia de Dio

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.games.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return FadeInUp(
                    child: _Slide(
                      game: widget.games[index],
                      onFavoritePressed: () {
                        _addToFavorites(widget.games[index].id);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addToFavorites(int gameId) async {
    try {
      // Aquí puedes obtener el userId (supongamos que ya lo tienes disponible)

      // URL del endpoint en tu backend para agregar a favoritos
      String url = 'http://10.12.26.68:3000/recommendation/review';

      // Datos a enviar en la solicitud POST
    

      // Realizar la solicitud POST al backend
      final response = await _dio.post(url, data:{
        'userId': userId,
        'gameId': gameId,
        'review': true, // El review siempre es true, como se especificó
      });

      // Verificar el estado de la respuesta
      if (response.statusCode == 201) {
        // Éxito, puedes hacer algo si lo deseas
        print('Juego agregado a favoritos exitosamente');
      } else {
        // Error en la solicitud, manejarlo según sea necesario
        print('Error al agregar juego a favoritos');
      }
    } catch (e) {
      // Error en la solicitud, manejarlo según sea necesario
      print('Error: $e');
    }
  }
}

class _Slide extends StatelessWidget {
  final Game game;
  final VoidCallback onFavoritePressed;

  const _Slide({
    required this.game,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                game.backgroundImage,
                fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }
                  return FadeIn(child: child);
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(width: 200, child: Text(game.name, maxLines: 2, style: textStyle.titleSmall)),
          SizedBox(
            width: 200,
            child: Row(
              children: [
                const SizedBox(width: 3),
                Expanded(
                  child: Text(
                    game.genres.toString(),
                    maxLines: 2,
                    style: textStyle.bodyMedium?.copyWith(color: Colors.blue.shade900),
                  ),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: onFavoritePressed,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
