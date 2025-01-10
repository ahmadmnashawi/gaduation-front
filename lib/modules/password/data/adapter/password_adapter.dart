abstract class IPasswordRepository {
  Future<bool> resetPassuser(String email, String newPassword);
}
