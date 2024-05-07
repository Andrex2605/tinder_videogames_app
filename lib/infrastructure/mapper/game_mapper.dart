

import 'package:tinder_videogames_app/infrastructure/game.dart';
import 'package:tinder_videogames_app/infrastructure/models/gamedb.dart';

class GameMapper{

  static Game gameDbToEntity(Gamedb gamedb) => Game(
    id: gamedb.id,
    backgroundImage:gamedb.backgroundImage,
    name:gamedb.name,
    genres:gamedb.genres 
  );
}