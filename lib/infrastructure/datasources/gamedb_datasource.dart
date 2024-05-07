

import 'package:dio/dio.dart';
import 'package:tinder_videogames_app/domain/datasource/game_datasources.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';

class GameDbDatasource extends GameDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'http://192.168.1.101:3000',
  
  ));


  @override
  Future<List<Game>> getGame(List<int> id) async {
  final responses = await Future.wait(id.map((id) => dio.get('/games/$id')));
  // Assuming each response item contains game data:
  
  return responses.map((response) => Game.fromJson(response.data)).toList();
}
}
