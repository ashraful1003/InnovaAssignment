import 'package:get/get.dart';
import 'package:innova_assign/controller/login_controller.dart';
import 'package:innova_assign/controller/user_controller.dart';

class InitController implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoginController());
    Get.lazyPut(() => UserController());
  }
}
