

import 'package:tinder_videogames_app/infrastructure/game.dart';

abstract class GameRepository {
  
  Future<List<Game>> getGame(List<int>id);

  Future<List<Game>> getRecommendations(int userId,int numberOfGames);
}