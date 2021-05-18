import 'package:dartz/dartz.dart';
import 'package:get_test/features/user/errors/user_failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<UserFailure, Type>> call(Params params);
}
