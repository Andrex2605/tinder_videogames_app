

// import 'package:dio/dio.dart';
// import 'package:tinder_videogames_app/domain/datasource/game_datasources.dart';
// import 'package:tinder_videogames_app/infrastructure/game.dart';

// class GameDbDatasource extends GameDatasource {
//   final dio = Dio(BaseOptions(
//     baseUrl: 'http://192.168.1.101:3000',
  
//   ));

//   @override
//   Future <Game> getGame(int gameId) async {
//    final response = await dio.get('/games/$gameId');

//    return response.data;
//   }
// }