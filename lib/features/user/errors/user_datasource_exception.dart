import 'package:get_test/features/user/errors/user_failure.dart';

class UserDatasourceException implements UserFailure {
  Object e;
  StackTrace stackTrace;

  UserDatasourceException({
    required this.e,
    required this.stackTrace,
  });
}
