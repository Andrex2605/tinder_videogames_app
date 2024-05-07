

import 'package:dio/dio.dart';
import 'package:tinder_videogames_app/domain/datasource/game_datasources.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';

class GameDbDatasource extends GameDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'http://10.12.23.34:3000',
  
  ));


  @override
  Future<List<Game>> getGame(List<int> id) async {
  final responses = await Future.wait(id.map((id) => dio.get('/games/$id')));
  // Assuming each response item contains game data:
  
  return responses.map((response) => Game.fromJson(response.data)).toList();
}

  @override

Future<List<Game>> getRecommendations(int userId, int numberOfGames) async {
  final responses = List.generate(
    numberOfGames, 
    (_) => dio.get('/recommendation/$userId/$numberOfGames')
  );

  final List<Game> games = [];
  for (var responseFuture in responses) {
    final Response response = await responseFuture;
    final Game game = Game.fromJson(response.data);
    games.add(game);
  }
  

  return games;
}


}


