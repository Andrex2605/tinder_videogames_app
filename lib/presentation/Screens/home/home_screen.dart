import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';
import 'package:tinder_videogames_app/main.dart';
import 'package:tinder_videogames_app/presentation/provider/card_provider.dart';
import 'package:tinder_videogames_app/presentation/provider/recommendation_provider.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videogames recomendations'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          _BuildCards(),
          
        ],
      )
      
    );
  }
}

class _BuildCards extends ConsumerStatefulWidget {
  const _BuildCards();

  @override
  _BuildCardsState createState() => _BuildCardsState();
}

class _BuildCardsState extends ConsumerState<_BuildCards> {
  @override
  void initState() {
    super.initState();
    ref.read(recommendationProvider.notifier).loadNextGame();
  }
  @override
  Widget build(BuildContext context) {
    final recommendationGames = ref.watch(recommendationProvider);

    return SizedBox.expand(
      child: Stack(
        children: [ListView.builder(
          itemCount: recommendationGames.length,
          itemBuilder: (context, index) {
            if (index == recommendationGames.length - 1) {
              // Si es el último elemento visible, carga más juegos
              ref.read(recommendationProvider.notifier).loadNextGame();
            }
            return SizedBox(
              height: 800,
              width: 400,
              child: Column(
                children: [
                  TinderCard(game: recommendationGames[index]),
                  
                ],
              ),
            );
          },
        ),
       
      ]),
      
    );
  }
}

class TinderCard extends StatelessWidget {
  final Game game;

  const TinderCard({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(game.backgroundImage),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.6, 1],
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: const Column(
            children: [
              Spacer(),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}




final cardProvider = Provider((ref) => CardProvider());
class ButtonsBuild extends ConsumerWidget {

  Game games;

  ButtonsBuild({super.key,required this.games});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(cardProvider.select((value) => value.getStatus()));
    final isLike = status == CardStatus.like;
    final isDisLike = status == CardStatus.dislike;
    final isIgnore = status == CardStatus.ignore;
    
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            foregroundColor: getColor(Colors.red, Colors.red, isDisLike),
            backgroundColor: getColor(Colors.red, Colors.white, isDisLike),
            side: getBorder(Colors.red, Colors.white, isDisLike),
          ),
          onPressed: () {ref.read(cardProvider).dislike();
          _addToDislike(games.id);},
          child: const Icon(Icons.clear, color: Colors.white, size: 50),
        ),
        ElevatedButton(
          style: ButtonStyle(
            foregroundColor: getColor(Colors.green, Colors.green, isIgnore),
            backgroundColor: getColor(Colors.green, Colors.white, isIgnore),
            side: getBorder(Colors.green, Colors.white, isIgnore),
          ),
          onPressed: () { ref.read(cardProvider).like();
            _addToFavorites(games.id);
          },
          child: const Icon(Icons.favorite, color: Colors.white, size: 50),
        ),
      ],
    );

    
  }
  Future<void> _addToFavorites(int gameId) async {
    final Dio dio = Dio();
    try {
      // Aquí puedes obtener el userId (supongamos que ya lo tienes disponible)
      // URL del endpoint en tu backend para agregar a favoritos
      String url = 'http://10.12.26.68:3000/recommendation/review';

      // Datos a enviar en la solicitud POST
      // Realizar la solicitud POST al backend
      Response response = await dio.post(url, data:{
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
  Future<void> _addToDislike(int gameId) async {
    final Dio dio = Dio();
    try {
      // Aquí puedes obtener el userId (supongamos que ya lo tienes disponible)
      // URL del endpoint en tu backend para agregar a favoritos
      String url = 'http://10.12.26.68:3000/recommendation/review';

      // Datos a enviar en la solicitud POST
      // Realizar la solicitud POST al backend
      Response response = await dio.post(url, data:{
        'userId': userId,
        'gameId': gameId,
        'review': false, // El review siempre es true, como se especificó
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

  MaterialStateProperty<Color> getColor(Color color,Color colorPressed, bool forced){
    getColor(Set<MaterialState> states){
      if (forced || states.contains(MaterialState.pressed)){
        return colorPressed;
      }else{
        return color;
      }
    }

    return MaterialStateProperty.resolveWith(getColor);
  }

  MaterialStateProperty<BorderSide> getBorder(Color color,Color colorPressed, bool forced){
    getBorder(Set<MaterialState> states){
      if (forced || states.contains(MaterialState.pressed)){
        return const BorderSide(color: Colors.transparent);
      }else{
        return BorderSide(color: color,width: 2);
      }
    }

    return MaterialStateProperty.resolveWith(getBorder);
  }





