import 'package:get/get.dart';
import 'package:get_test_sample/application/api/api_dio.dart';
import 'package:get_test_sample/constants.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ApiDio(AppContsntas.baseUrl, AppContsntas.headers).init(),
    );
  }
}
