
import 'dart:convert';

Game gameFromJson(String str) => Game.fromJson(json.decode(str));

String gameToJson(Game data) => json.encode(data.toJson());

class Game {
    int id;
    String name;
    String backgroundImage;
    List<String> genres;

    Game({
        required this.id,
        required this.name,
        required this.backgroundImage,
        required this.genres,
      
    });

    Game gameFromJson(String str) {    

      final jsonData = json.decode(str);    
      return Game.fromJson(jsonData);
}
    factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        name: json["name"],
        backgroundImage: json["background_image"],
        genres: List<String>.from(json["genres"].map((x) => x)),

    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "background_image": backgroundImage,
        "genres": List<dynamic>.from(genres.map((x) => x)),
    };
}

