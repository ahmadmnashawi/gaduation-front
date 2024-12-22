import 'dart:typed_data';

class Game {
  int? Id;
  String? GameName;
  String? GameLevel;
  Uint8List? Image;
  Game({this.Id, this.GameName, this.GameLevel, this.Image});

  Game.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    GameName = json['gameName'];
    GameLevel = json['gameLevel'];
    Image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['gameName'] = GameName;
    json['gameLevel'] = GameLevel;
    json['id'] = Id;
    return json;
  }
}
