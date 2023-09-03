import 'package:get/get.dart';

import '../controllers/spendings_controller.dart';

class SpendingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpendingsController>(
      () => SpendingsController(),
    );
  }
}
