import 'package:get_test/features/home/errors/user_repository_failure.dart';

class UserRepositoryPageException implements UserRepositoryFailure {
  Object e;
  StackTrace stackTrace;
  UserRepositoryPageException({
    required this.e,
    required this.stackTrace,
  });
}
