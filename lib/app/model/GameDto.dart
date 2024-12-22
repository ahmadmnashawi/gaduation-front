import 'game.dart';
import 'game_user.dart';

class GameDto {
  Game? game;
  List<GameUser>? gameUser;
  GameDto({
    this.game,
    this.gameUser,
  });

  GameDto.fromJson(Map<String, dynamic> json) {
    game = Game.fromJson(json['game']);
    gameUser = <GameUser>[];
    if (json['gameUser'] != null) {
      for (var item in json['gameUser']) {
        gameUser!.add(GameUser.fromJson(item));
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['game'] = game!.toJson();
    json['gameUser'] = gameUser!.map((e) => e.toJson());
    return json;
  }
}
