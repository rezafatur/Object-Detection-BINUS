import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  void logoutUser() {
    // Hapus token dari GetStorage
    final storage = GetStorage();
    storage.remove('token');

    // Pindah ke Halaman Login
    Get.offAllNamed(Routes.LOGIN);
  }
}
