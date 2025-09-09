import 'package:get/get.dart';
import 'package:laundryhub/utils/network/network_manager.dart';

class GeneralBindings extends Bindings {
  
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
