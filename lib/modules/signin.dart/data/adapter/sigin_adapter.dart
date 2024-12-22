
import 'package:graduationproject/app/model/user.dart';

abstract class ISigninRepository {
    Future<User?> SignInUser(String email, String Password);
    

 }