
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';
import 'package:tinder_videogames_app/presentation/provider/recommendation_provider.dart';

// Assuming CardProvider holds state and methods for card interactions
class TinderCard extends ConsumerStatefulWidget {
  const TinderCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TinderCardState createState() => _TinderCardState();
}


class _TinderCardState extends ConsumerState<TinderCard> {

  @override
  void initState() {
    super.initState();
    ref.read(recommendationProvider.notifier).loadNextGame();
  }
  @override
  Widget build(BuildContext context) {
    final recommendationGames = ref.watch(recommendationProvider);
    return BuildCard(games:recommendationGames);
  }
}



class BuildCard extends StatefulWidget {
  final List<Game> games;
  final VoidCallback?  loadNextPage;
  const BuildCard({
    super.key,
     required this.games, this.loadNextPage,
  });



  @override
  State<BuildCard> createState() => _BuildCardState();
}

class _BuildCardState extends State<BuildCard> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.atEdge) {
      if (_scrollController.position.pixels == 0) {
        // Estás al principio de la lista
      } else {
        // Estás al final de la lista
        if (widget.loadNextPage != null) {
          widget.loadNextPage!(); // Llama a la función para cargar más juegos
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.games.length,
        itemBuilder: (context, index) {
          if (index == widget.games.length - 1) {
            // Si es el último elemento visible, carga más juegos
            if (widget.loadNextPage != null) {
              widget.loadNextPage!(); // Llama a la función para cargar más juegos
            }
          }
          return _Card(game: widget.games[index]);
        },
      ),
    );
  }
}



class _Card extends StatelessWidget {

  final Game game;

  const _Card({
     required this.game
  });

  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:DecorationImage(
          image: NetworkImage(game.backgroundImage),
          fit: BoxFit.cover,
          alignment: Alignment.center
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6,1]
          )
        ),
        padding: const EdgeInsets.all(20),
        child:  const Column(
          children: [
            Spacer(),
            // BuildName(widget: widget),
            SizedBox(height: 8),
          ],),
      ),
    );
  }
}



// class BuildName extends StatelessWidget {
//   const BuildName({
//     super.key,
//     required this.widget,
//   });

//   final TinderCard widget;

//   @override
//   Widget build(BuildContext context) {
//     return  Row(
//       children: [
//         Text(widget.name,style: const TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
//         const SizedBox(width: 10),
//         Text(widget.gender,style: const TextStyle(fontSize: 26,color: Colors.white),)
//       ],);
//   }
// }


