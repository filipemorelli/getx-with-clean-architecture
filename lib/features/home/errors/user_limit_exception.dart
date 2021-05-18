import 'package:get_test/features/home/errors/user_repository_failure.dart';

class UserLimitException implements UserRepositoryFailure {
  Object e;
  StackTrace stackTrace;

  UserLimitException({
    required this.e,
    required this.stackTrace,
  });
}
