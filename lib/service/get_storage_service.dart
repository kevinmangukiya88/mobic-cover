import 'package:get_storage/get_storage.dart';

class GetStorageServices {
  static GetStorage getStorage = GetStorage();
  static String isUserLoggedIn = 'isUserLoggedIn';

  /// FOR LOG IN
  static setUserLoggedIn() async {
    await getStorage.write(isUserLoggedIn, true);
  }

  static getUserLoggedInStatus() {
    return getStorage.read(isUserLoggedIn);
  }

  /// CLEAR STORAGE
  static logOut() {
    getStorage.erase();
  }
}
