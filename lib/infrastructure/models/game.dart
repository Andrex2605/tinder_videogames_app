
import 'dart:convert';

Game gameFromJson(String str) => Game.fromJson(json.decode(str));

String gameToJson(Game data) => json.encode(data.toJson());

class Game {
    int id;
    String slug;
    String name;
    DateTime released;
    String backgroundImage;
    double rating;
    int ratingTop;
    int ratingsCount;
    int metacritic;
    int playtime;
    DateTime updated;
    List<String> platforms;
    List<String> genres;
    List<String> stores;
    List<String> tags;
    String esrbRating;

    Game({
        required this.id,
        required this.slug,
        required this.name,
        required this.released,
        required this.backgroundImage,
        required this.rating,
        required this.ratingTop,
        required this.ratingsCount,
        required this.metacritic,
        required this.playtime,
        required this.updated,
        required this.platforms,
        required this.genres,
        required this.stores,
        required this.tags,
        required this.esrbRating,
    });

    factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        slug: json["slug"],
        name: json["name"],
        released: DateTime.parse(json["released"]),
        backgroundImage: json["background_image"],
        rating: json["rating"]?.toDouble(),
        ratingTop: json["rating_top"],
        ratingsCount: json["ratings_count"],
        metacritic: json["metacritic"],
        playtime: json["playtime"],
        updated: DateTime.parse(json["updated"]),
        platforms: List<String>.from(json["platforms"].map((x) => x)),
        genres: List<String>.from(json["genres"].map((x) => x)),
        stores: List<String>.from(json["stores"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
        esrbRating: json["esrb_rating"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "released": "${released.year.toString().padLeft(4, '0')}-${released.month.toString().padLeft(2, '0')}-${released.day.toString().padLeft(2, '0')}",
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings_count": ratingsCount,
        "metacritic": metacritic,
        "playtime": playtime,
        "updated": "${updated.year.toString().padLeft(4, '0')}-${updated.month.toString().padLeft(2, '0')}-${updated.day.toString().padLeft(2, '0')}",
        "platforms": List<dynamic>.from(platforms.map((x) => x)),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "stores": List<dynamic>.from(stores.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "esrb_rating": esrbRating,
    };
}
