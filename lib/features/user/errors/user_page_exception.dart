import 'package:get_test/features/user/errors/user_failure.dart';

class UserPageException implements UserFailure {
  Object e;
  StackTrace stackTrace;
  UserPageException({
    required this.e,
    required this.stackTrace,
  });
}
