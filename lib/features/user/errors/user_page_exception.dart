import 'package:get_test_sample/features/user/errors/user_failure.dart';

class UserPageException implements UserFailure {
  Object e;
  StackTrace stackTrace;
  UserPageException({
    required this.e,
    required this.stackTrace,
  });
}
