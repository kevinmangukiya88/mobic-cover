import 'package:get/get.dart';
import 'package:mobic_cover/view_model/home_view_model.dart';

class ControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel(), fenix: true);
  }
}
