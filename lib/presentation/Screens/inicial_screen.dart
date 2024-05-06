import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';
import 'package:dio/dio.dart';

class InicialView extends StatelessWidget {
  const InicialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: _InicialScreen(games:getGame()),
    );
  }
}

class _InicialScreen extends StatefulWidget {

  List<Game> games;
  _InicialScreen({required this.games});
  
  

  @override
  State<_InicialScreen> createState() => _InicialScreenState();
}

class _InicialScreenState extends State<_InicialScreen> {
   
  Game? game;
  List<int> gamesId = [141,509,435,175,1592,1155,833,3316,353,1791,608,164];

  @override
  void initState() {
    
    super.initState();
    getGames(gamesId);
  }

  Future<List<Game>> getGames(List<int> ids) async {
  final responses = await Future.wait(ids.map((id) => Dio().get('https:///games/$id')));
  return responses.map((response) => Game.fromJson(response.data)).toList();
}
 
  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView( 
        child: Column(
          children: [
            const SizedBox(
              width: 250,
              height: 200,
              child: Image(
              image: AssetImage('assets/images/Logo.jpg'),
                fit: BoxFit.cover, // Resize the image to cover the entire container
              ),
            ),
            const SizedBox(height: 30),
            const Text('Por favor selecciona todos los juegos que te gusten, esto nos ayudara a brindarte una mejor experiencia',style: TextStyle(fontSize: 18),),
            const Text('Debes escoger al menos 3',style: TextStyle(fontSize: 18)),
            const SizedBox(height: 50),
            Expanded(
            child: ListView.builder(
              itemCount: widget.games.length,
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index) {
                return FadeInUp(child: _Slide(game: widget.games[index]));
              }
            )
          ),
            const SizedBox(height: 50),
            OutlinedButton(onPressed: (){}, child: const Text('Listo')),
            const SizedBox(height: 50,)
          ],
        )
    );
  }
}


class _Slide extends StatelessWidget {

  final Game game;

  const _Slide({required this.game});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(game.backgroundImage,
              fit: BoxFit.cover,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress!=null) {
                    return const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    );
                  }
                  
                  return FadeIn(child: child);
                },
              ),
            )
          ),

          const SizedBox(height: 5),

          SizedBox(width: 150,
            child: Text(game.name,
              maxLines: 2,
              style: textStyle.titleSmall,
            )
          ),
          SizedBox(
            width: 150,
            child: Text(game.genres[0], style: textStyle.titleSmall,),
            ),
        ],
      )
    );
  }
}
// // ignore: must_be_immutable
// class CardGame extends StatefulWidget {

//   final String image;
//   final String name;
  

//   bool isChecked = false;
//   CardGame({super.key, required this.image, required this.name});

//   @override
//   State<CardGame> createState() => _CardGameState();
// }

// class _CardGameState extends State<CardGame> {
//    bool _isChecked = false; // Internal state for checkbox

//   @override
//   void initState() {
//     super.initState();
//     _isChecked = widget.isChecked; // Initialize from widget's value
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 4, // Add some shadow effect
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Image.network(widget.image, height: 100), // Display the image
//             const SizedBox(height: 16),
//             Text(
//               widget.name,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             // Text(
//             //   widget.game.genres as String,
//             //   style: const TextStyle(fontSize: 16),
//             // ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Checkbox(
//                   value: _isChecked,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       _isChecked = value!; // Update internal state
//                     });
//                   },
//                 ),
//                 const Text('Seleccionar'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
