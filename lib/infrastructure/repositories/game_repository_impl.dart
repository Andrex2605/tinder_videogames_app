
import 'package:tinder_videogames_app/domain/datasource/game_datasources.dart';
import 'package:tinder_videogames_app/domain/repositories/games_repositories.dart';
import 'package:tinder_videogames_app/infrastructure/game.dart';

class GameRepositoryImpl extends GameRepository {
  final GameDatasource datasource;
  GameRepositoryImpl(this.datasource);

  @override
  Future<List<Game>> getGame(List<int> id) {
    return datasource.getGame(id);
  }
  
}