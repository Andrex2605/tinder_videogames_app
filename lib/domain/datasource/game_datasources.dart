
import '../../infrastructure/models/game.dart';

abstract class GameDatasource {
  
  Future <Game>getGame(int gameId);


}