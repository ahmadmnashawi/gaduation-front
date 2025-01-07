import '../../../../app/model/GameDto.dart';
import '../../../../app/model/game_user.dart';

abstract class IGameRepository {
  Future<List<GameDto>> Getgame(int idUser);
  Future<GameDto> getUserGameLevels(int idUser, idGame);
  Future<bool> DelContent(int id);
  Future<bool> updateUserGame(int iduserGame, GameUser gameUser);
}
