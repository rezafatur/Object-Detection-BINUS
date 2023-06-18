import 'package:get/get.dart';
import '../controllers/bahaya_controller.dart';

class BahayaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BahayaController>(
      () => BahayaController(),
    );
  }
}
