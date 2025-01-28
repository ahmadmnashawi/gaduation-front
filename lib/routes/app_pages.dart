import 'package:get/get.dart';
import 'package:graduationproject/modules/signup/view/signup1.dart';

import '../modules/BookType/binding/booktype.dart';
import '../modules/BookType/view/booktype_view.dart';
import '../modules/Intro/binding/intro_binding.dart';
import '../modules/Intro/view/splash-screen.dart';
import '../modules/MenuGame/Menu_game.dart';
import '../modules/MenuGame/binding/menu_game_binding.dart';
import '../modules/MenuGame/view/all_games/foucs/bindings/foucs_binding.dart';
import '../modules/MenuGame/view/all_games/letter_game/bindings/letter_game_binding.dart';
import '../modules/MenuGame/view/all_games/math/bindings/math_binding.dart';
import '../modules/MenuGame/view/all_games/word_game/bindings/word_game_binding.dart';
import '../modules/comment/bindings/comment_binding.dart';
import '../modules/complaints/binding/complaints_binding.dart';
import '../modules/complaints/view/complaints.dart';
import '../modules/complaints/view/user_complaints.dart';
import '../modules/content/binding/content_binding.dart';
import '../modules/content/view/content.dart';
import '../modules/give permission/binding/permission_binding.dart';
import '../modules/groups/binding/group_binding.dart';
import '../modules/groups/view/show_group.dart';
import '../modules/libraryy/binding/library_Binding.dart';
import '../modules/libraryy/view/show_librarys.dart';
import '../modules/menu/binding/menu_binding.dart';
import '../modules/menu/view/HomePage.dart';
import '../modules/password/binding/password_binding.dart';
import '../modules/password/view/password.dart';
import '../modules/profile/binding/profile_binding.dart';
import '../modules/profile/view/edit_profile.dart';
import '../modules/refrence/binding/refrence_binding.dart';
import '../modules/refrence/view/refrence.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/settings/binding/setting_binding.dart';
import '../modules/settings/view/settings.dart';
import '../modules/signin.dart/binding/signin_binding.dart';
import '../modules/signin.dart/view/signin.dart';
import '../modules/signup/binding/signup_binding.dart';
import '../modules/testwidget/binding/test_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static final routes = [
    GetPage(
      name: _Paths.FirstSplash,
      page: () => SplashScreen(),
      binding: IntroBinding(),
    ),
    GetPage(
        name: _Paths.SignIn,
        page: () => SignInViewPage(),
        binding: SignInBinding()),
    GetPage(
        name: _Paths.setting,
        page: () => SettingPageView(),
        binding: SetteingBinding()),
    GetPage(
        name: _Paths.complaint,
        page: () => ComplaintspageView(),
        binding: ComplainsBinding()),
    GetPage(
        name: _Paths.userComplaint,
        page: () => UserComplaintspageView(),
        binding: ComplainsBinding()),
    GetPage(
        name: _Paths.SignIn,
        page: () => SignInViewPage(),
        binding: SignInBinding()),
    GetPage(
        name: _Paths.refrence,
        page: () => RefrencePageView(),
        binding: RefrenceBinding()),
    GetPage(
        name: _Paths.booktype,
        page: () => BookTypePageView(),
        binding: BooktypeBinding()),
    GetPage(name: _Paths.home, page: () => HomePage(), bindings: [
      HomeBinding(),
      SetteingBinding(),
      ProfileBinding(),
      BooktypeBinding(),
      CommentBinding(),
      MenuGameBinding(),
      SearchBinding(),
      GroupBinding(),
      FoucsBinding(),
      LetterBinding(),
      WordGameBinding(),
      PermissionBinding(),
      TestBinding(),
      RefrenceBinding(),
      ComplainsBinding(),
      LibraryBinding(),
      MathBinding()
    ], children: [
      GetPage(
        name: _Paths.editProfile,
        page: () => EditProfileview(),
      ),
      GetPage(
        name: _Paths.group,
        page: () => ShowGroupPageView(),
      ),
    ]),
    GetPage(
      name: _Paths.MenuGame,
      page: () => MenuGamePageView(),
      bindings: const [],
    ),
    GetPage(
        name: _Paths.password,
        page: () => ForgetViewPage(),
        binding: PasswordBinding()),
    GetPage(
        name: _Paths.signup, page: () => signupage(), binding: SignUpBinding()),
    GetPage(
        name: _Paths.content,
        page: () => Contentpage(),
        binding: ContentBinding()),
    GetPage(
        name: _Paths.libery,
        page: () => ShowLibraryspage(),
        binding: LibraryBinding()),
  ];
}
