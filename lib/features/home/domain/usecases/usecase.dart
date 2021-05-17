import 'package:dartz/dartz.dart';
import 'package:get_test/features/home/errors/user_repository_failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<UserRepositoryFailure, Type>> call(Params params);
}
