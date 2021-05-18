import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_test_sample/features/user/domain/entities/user_entity.dart';
import 'package:get_test_sample/features/user/domain/usecases/get_users.dart';
import 'package:get_test_sample/features/user/presentation/controller/user_controller.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import './user_controller_test.mocks.dart';

@GenerateMocks(<Type>[GetUsersUserCase])
void main() {
  late MockGetUsersUserCase usecase;
  late UserController userController;

  setUp(() {
    usecase = MockGetUsersUserCase();
    userController = UserController(usecase);
  });

  test('should return a list of users', () async {
    when(usecase.call(any))
        .thenAnswer((_) async => Right(<UserEntity>[UserEntity(id: '1', name: 'name', username: 'username')]));
    await userController.findUsers();
    expect(userController.users.length, 1);
  });
}
