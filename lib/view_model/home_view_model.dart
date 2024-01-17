import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  RxInt counter = 0.obs;

  void incrementCounter() {
    counter.value++;
  }
}
