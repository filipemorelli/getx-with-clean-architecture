import 'package:get/get.dart';
import 'package:get_test/features/user/data/datasources/mockapi_datasource.dart';
import 'package:get_test/features/user/data/repositories/user_repository_impl.dart';
import 'package:get_test/features/user/domain/usecases/get_users.dart';
import 'package:get_test/features/user/presentation/controller/user_controller.dart';

class UserBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MockapiDataSource(Get.find()));
    Get.lazyPut(() => UserRepositoryImpl(Get.find<MockapiDataSource>()));
    Get.lazyPut(() => GetUsers(Get.find<UserRepositoryImpl>()));
    Get.lazyPut(() => UserController(Get.find<GetUsers>()));
  }
}
