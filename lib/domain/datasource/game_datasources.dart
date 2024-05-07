
import 'package:tinder_videogames_app/infrastructure/game.dart';


abstract class GameDatasource {
  
  Future<List<Game>> getGame(List<int> id);

  

}