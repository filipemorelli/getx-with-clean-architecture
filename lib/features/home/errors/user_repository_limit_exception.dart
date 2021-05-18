import 'package:get_test/features/home/errors/user_repository_failure.dart';

class UserRepositoryLimitException implements UserRepositoryFailure {
  Object e;
  StackTrace stackTrace;

  UserRepositoryLimitException({
    required this.e,
    required this.stackTrace,
  });
}
