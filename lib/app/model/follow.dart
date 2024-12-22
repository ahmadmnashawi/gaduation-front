import 'package:graduationproject/app/model/user.dart';

class Follow {
  int? Id;
  int? followId;
  int? followedId;
  User? follow;
  User? followed;

  Follow({
    this.Id,
    this.follow,
    this.followId,
    this.followed,
    this.followedId,
  });

  Follow.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    followId = json['followId'];
    followedId = json['followedId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id ?? 0;
    json['followId'] = followId;
    json['followedId'] = followedId;
    return json;
  }
}
