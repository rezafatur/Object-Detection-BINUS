import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
<<<<<<< HEAD
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
=======
>>>>>>> ea5862983a5082964ec537e9a00f9ef9aa202e34
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
<<<<<<< HEAD
      children: [
        GetPage(
          name: _Paths.LOGIN,
          page: () => const LoginView(),
          binding: LoginBinding(),
        ),
      ],
=======
>>>>>>> ea5862983a5082964ec537e9a00f9ef9aa202e34
    ),
  ];
}
