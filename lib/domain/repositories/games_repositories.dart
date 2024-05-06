
import '../../infrastructure/models/game.dart';

abstract class GameRepository {
  
  Future <Game>getGame(int gameId);


}