
import 'gamedb.dart';

class GameDbResponse {
    List<Gamedb> results;

    GameDbResponse({required this.results});

    factory GameDbResponse.fromJson(Map<String, dynamic> json) => GameDbResponse(
        results: List<Gamedb>.from(json["results"].map((x) => Gamedb.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson()))
    };
}

enum EsrbRating {
    ADULTS_ONLY,
    EMPTY,
    EVERYONE,
    EVERYONE_10,
    MATURE,
    RATING_PENDING,
    TEEN
}

final esrbRatingValues = EnumValues({
    "Adults Only": EsrbRating.ADULTS_ONLY,
    "": EsrbRating.EMPTY,
    "Everyone": EsrbRating.EVERYONE,
    "Everyone 10+": EsrbRating.EVERYONE_10,
    "Mature": EsrbRating.MATURE,
    "Rating Pending": EsrbRating.RATING_PENDING,
    "Teen": EsrbRating.TEEN
});

enum Genre {
    ACTION,
    ADVENTURE,
    ARCADE,
    BOARD_GAMES,
    CARD,
    CASUAL,
    EDUCATIONAL,
    FAMILY,
    FIGHTING,
    INDIE,
    MASSIVELY_MULTIPLAYER,
    PLATFORMER,
    PUZZLE,
    RACING,
    RPG,
    SHOOTER,
    SIMULATION,
    SPORTS,
    STRATEGY
}

final genreValues = EnumValues({
    "Action": Genre.ACTION,
    "Adventure": Genre.ADVENTURE,
    "Arcade": Genre.ARCADE,
    "Board Games": Genre.BOARD_GAMES,
    "Card": Genre.CARD,
    "Casual": Genre.CASUAL,
    "Educational": Genre.EDUCATIONAL,
    "Family": Genre.FAMILY,
    "Fighting": Genre.FIGHTING,
    "Indie": Genre.INDIE,
    "Massively Multiplayer": Genre.MASSIVELY_MULTIPLAYER,
    "Platformer": Genre.PLATFORMER,
    "Puzzle": Genre.PUZZLE,
    "Racing": Genre.RACING,
    "RPG": Genre.RPG,
    "Shooter": Genre.SHOOTER,
    "Simulation": Genre.SIMULATION,
    "Sports": Genre.SPORTS,
    "Strategy": Genre.STRATEGY
});

enum Platform {
    ANDROID,
    APPLE_II,
    ATARI_2600,
    ATARI_5200,
    ATARI_7800,
    ATARI_8_BIT,
    ATARI_LYNX,
    ATARI_ST,
    ATARI_XEGS,
    CLASSIC_MACINTOSH,
    COMMODORE_AMIGA,
    DREAMCAST,
    GAME_BOY,
    GAME_BOY_ADVANCE,
    GAME_BOY_COLOR,
    GAME_CUBE,
    GAME_GEAR,
    GENESIS,
    I_OS,
    JAGUAR,
    LINUX,
    MAC_OS,
    NEO_GEO,
    NES,
    NINTENDO_3_DS,
    NINTENDO_64,
    NINTENDO_DS,
    NINTENDO_D_SI,
    NINTENDO_SWITCH,
    PC,
    PLAY_STATION,
    PLAY_STATION_2,
    PLAY_STATION_3,
    PLAY_STATION_4,
    PLAY_STATION_5,
    PSP,
    PS_VITA,
    SEGA_32_X,
    SEGA_CD,
    SEGA_MASTER_SYSTEM,
    SEGA_SATURN,
    SNES,
    THE_3_DO,
    WEB,
    WII,
    WII_U,
    XBOX,
    XBOX_360,
    XBOX_ONE,
    XBOX_SERIES_S_X
}

final platformValues = EnumValues({
    "Android": Platform.ANDROID,
    "Apple II": Platform.APPLE_II,
    "Atari 2600": Platform.ATARI_2600,
    "Atari 5200": Platform.ATARI_5200,
    "Atari 7800": Platform.ATARI_7800,
    "Atari 8-bit": Platform.ATARI_8_BIT,
    "Atari Lynx": Platform.ATARI_LYNX,
    "Atari ST": Platform.ATARI_ST,
    "Atari XEGS": Platform.ATARI_XEGS,
    "Classic Macintosh": Platform.CLASSIC_MACINTOSH,
    "Commodore / Amiga": Platform.COMMODORE_AMIGA,
    "Dreamcast": Platform.DREAMCAST,
    "Game Boy": Platform.GAME_BOY,
    "Game Boy Advance": Platform.GAME_BOY_ADVANCE,
    "Game Boy Color": Platform.GAME_BOY_COLOR,
    "GameCube": Platform.GAME_CUBE,
    "Game Gear": Platform.GAME_GEAR,
    "Genesis": Platform.GENESIS,
    "iOS": Platform.I_OS,
    "Jaguar": Platform.JAGUAR,
    "Linux": Platform.LINUX,
    "macOS": Platform.MAC_OS,
    "Neo Geo": Platform.NEO_GEO,
    "NES": Platform.NES,
    "Nintendo 3DS": Platform.NINTENDO_3_DS,
    "Nintendo 64": Platform.NINTENDO_64,
    "Nintendo DS": Platform.NINTENDO_DS,
    "Nintendo DSi": Platform.NINTENDO_D_SI,
    "Nintendo Switch": Platform.NINTENDO_SWITCH,
    "PC": Platform.PC,
    "PlayStation": Platform.PLAY_STATION,
    "PlayStation 2": Platform.PLAY_STATION_2,
    "PlayStation 3": Platform.PLAY_STATION_3,
    "PlayStation 4": Platform.PLAY_STATION_4,
    "PlayStation 5": Platform.PLAY_STATION_5,
    "PSP": Platform.PSP,
    "PS Vita": Platform.PS_VITA,
    "SEGA 32X": Platform.SEGA_32_X,
    "SEGA CD": Platform.SEGA_CD,
    "SEGA Master System": Platform.SEGA_MASTER_SYSTEM,
    "SEGA Saturn": Platform.SEGA_SATURN,
    "SNES": Platform.SNES,
    "3DO": Platform.THE_3_DO,
    "Web": Platform.WEB,
    "Wii": Platform.WII,
    "Wii U": Platform.WII_U,
    "Xbox": Platform.XBOX,
    "Xbox 360": Platform.XBOX_360,
    "Xbox One": Platform.XBOX_ONE,
    "Xbox Series S/X": Platform.XBOX_SERIES_S_X
});

enum Store {
    APP_STORE,
    EPIC_GAMES,
    GOG,
    GOOGLE_PLAY,
    ITCH_IO,
    NINTENDO_STORE,
    PLAY_STATION_STORE,
    STEAM,
    XBOX_360_STORE,
    XBOX_STORE
}

final storeValues = EnumValues({
    "App Store": Store.APP_STORE,
    "Epic Games": Store.EPIC_GAMES,
    "GOG": Store.GOG,
    "Google Play": Store.GOOGLE_PLAY,
    "itch.io": Store.ITCH_IO,
    "Nintendo Store": Store.NINTENDO_STORE,
    "PlayStation Store": Store.PLAY_STATION_STORE,
    "Steam": Store.STEAM,
    "Xbox 360 Store": Store.XBOX_360_STORE,
    "Xbox Store": Store.XBOX_STORE
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
