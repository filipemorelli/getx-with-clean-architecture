import 'package:dartz/dartz.dart';
import 'package:get_test/features/home/errors/user_repository_exception.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
