import 'package:get_test_sample/features/user/errors/user_failure.dart';

class UserLimitException implements UserFailure {
  Object e;
  StackTrace stackTrace;

  UserLimitException({
    required this.e,
    required this.stackTrace,
  });
}
