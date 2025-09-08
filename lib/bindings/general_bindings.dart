import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:laundryhub/utils/network/network_manager.dart';

class GeneralBindings extends Bindings {
  
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
