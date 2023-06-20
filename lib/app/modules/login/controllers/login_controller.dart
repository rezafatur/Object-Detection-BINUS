import 'package:get/get.dart';
import 'package:object_detection_app/app/routes/app_pages.dart';
import '../../../data/providers/api.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> loginUser(String email, String password) async {
    try {
      isLoading.value = true;
      var response = await ApiService().loginUser(email, password);
      if (response['token'] != null) {
        // Pindah ke halaman Home
        Get.offAllNamed(Routes.HOME);
      } else {
        // Jika Terjadi Kesalahan, Tampilkan Pesan Error
        errorMessage.value = "Email atau Password Salah";
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
