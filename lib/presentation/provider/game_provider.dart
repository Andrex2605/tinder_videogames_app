

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';
import 'package:tinder_videogames_app/presentation/provider/game_repository_provider.dart';


final gameProvider = StateNotifierProvider<GameNotifier, List<Game>>((ref){
  
  final fetchGame = ref.watch(gameRepositoryProvider).getGame;
  final id=[141,509,435,175,1592,1155,833,3316,353,1791,402,608];
  return GameNotifier(fetchGame: fetchGame,id: id);
});

typedef GameCallback = Future<List<Game>> Function(List<int>);


class GameNotifier extends StateNotifier<List<Game>>{


  bool isLoading = false;
  GameCallback fetchGame;
  List<int> id;
  GameNotifier({
    required this.fetchGame,required this.id
  }):super([]);

  Future<void> loadNextGame() async{
    if (isLoading) return;

    isLoading = true;
    final List<Game> game = await fetchGame(id);
    state = [ ...state, ...game];
    await Future.delayed(const Duration(milliseconds: 300));
    print(game);
    isLoading = false;
  }
}