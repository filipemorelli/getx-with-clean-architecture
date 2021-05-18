import 'package:get_test/features/user/errors/user_failure.dart';

class UserLimitException implements UserFailure {
  Object e;
  StackTrace stackTrace;

  UserLimitException({
    required this.e,
    required this.stackTrace,
  });
}
