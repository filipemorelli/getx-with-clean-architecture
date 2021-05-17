import 'package:dartz/dartz.dart';
import 'package:get_test/features/home/domain/entities/pagination_filter_entity.dart';
import 'package:get_test/features/home/domain/entities/user_entity.dart';
import 'package:get_test/features/home/domain/repositories/user_repository.dart';
import 'package:get_test/features/home/domain/usecases/usecase.dart';
import 'package:get_test/features/home/errors/user_repository_exception.dart';

abstract class GetUsersUserCase extends UseCase<List<UserEntity>, PaginationFilterEntity> {
  @override
  Future<Either<Failure, List<UserEntity>>> call(PaginationFilterEntity params);
}

class GetUsers implements GetUsersUserCase {
  UserRepository _repository;

  GetUsers(this._repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call(PaginationFilterEntity params) {
    return Future.value();
  }
}
