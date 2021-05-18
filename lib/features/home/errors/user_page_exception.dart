import 'package:get_test/features/home/errors/user_repository_failure.dart';

class UserPageException implements UserRepositoryFailure {
  Object e;
  StackTrace stackTrace;
  UserPageException({
    required this.e,
    required this.stackTrace,
  });
}
