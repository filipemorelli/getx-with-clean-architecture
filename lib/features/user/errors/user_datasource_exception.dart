import 'package:get_test_sample/features/user/errors/user_failure.dart';

class UserDatasourceException implements UserFailure {
  Object e;
  StackTrace stackTrace;

  UserDatasourceException({
    required this.e,
    required this.stackTrace,
  });
}
