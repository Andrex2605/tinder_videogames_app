

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:tinder_videogames_app/presentation/provider/game_repository_provider.dart';

// import '../../infrastructure/models/game.dart';

// final gameProvider = StateNotifierProvider<GameNotifier, Game>((ref){
//   final fetchGame = ref.watch(gameRepositoryProvider).getGame;
//   return GameNotifier(fetchGame: fetchGame);
// });

// typedef GameCallback = Future<Game> Function({int gameId});


// class GameNotifier extends StateNotifier<Game>{


//   bool isLoading = false;
//   GameCallback fetchGame;

//   GameNotifier({
//     required this.fetchGame
//   }) : super(Game as Game);

//   Future<void> loadNextGame() async{
//     if (isLoading) return;

//     isLoading = true;
//     final game = await fetchGame();

//     state = game;
//     isLoading = false;
//   }
// }