

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';
import 'package:tinder_videogames_app/main.dart';
import 'package:tinder_videogames_app/presentation/provider/game_repository_provider.dart';


final recommendationProvider = StateNotifierProvider<GameNotifier, List<Game>>((ref){
  
  final fetchGame = ref.watch(gameRepositoryProvider).getRecommendations;
  final id = userId;
  return GameNotifier(fetchGame: fetchGame,id: id! ,numberOfGames: 10);
});

typedef GameCallback = Future<List<Game>> Function(int id,int numberOfGames);


class GameNotifier extends StateNotifier<List<Game>>{


  bool isLoading = false;
  GameCallback fetchGame;
  int id;
  int numberOfGames;
  GameNotifier({
    required this.fetchGame,required this.id,required this.numberOfGames
  }):super([]);

  Future<void> loadNextGame() async{
    if (isLoading) return;

    isLoading = true;
    final List<Game> game = await fetchGame(id,numberOfGames);
    state = [ ...state, ...game];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}