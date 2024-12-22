import 'package:graduationproject/app/model/user.dart';

import 'game.dart';

class GameUser {
  int? Id;
  String? userLevel;
  int? IdGame;
  Game? game;
  int? IdUser;
  User? user;
  int? Score;
  GameUser({
    this.Id,
    this.IdGame,
    this.game,
    this.IdUser,
    this.user,
    this.userLevel,
    this.Score,
  });

  GameUser.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    IdGame = json['idGame'];
    game = json['game'];
    IdUser = json['idUser'];
    user = json['user'];
    userLevel = json['userLevel'];
    Score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id;
    json['idGame'] = IdGame;
    json['idUser'] = IdUser;
    json['userLevel'] = userLevel;
    json['score'] = Score;
    return json;
  }
}
