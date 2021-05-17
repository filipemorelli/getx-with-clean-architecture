import 'package:dartz/dartz.dart';
import 'package:get_test/features/home/domain/entities/pagination_filter_entity.dart';
import 'package:get_test/features/home/domain/entities/user_entity.dart';
import 'package:get_test/features/home/domain/repositories/user_repository.dart';
import 'package:get_test/features/home/domain/usecases/usecase.dart';
import 'package:get_test/features/home/errors/user_repository_failure.dart';
import 'package:get_test/features/home/errors/user_repository_limit_exception%20copy.dart';
import 'package:get_test/features/home/errors/user_repository_page_exception.dart';

abstract class GetUsersUserCase extends UseCase<List<UserEntity>, PaginationFilterEntity> {
  @override
  Future<Either<UserRepositoryFailure, List<UserEntity>>> call(PaginationFilterEntity params);
}

class GetUsers implements GetUsersUserCase {
  UserRepository _repository;

  GetUsers(this._repository);

  @override
  Future<Either<UserRepositoryFailure, List<UserEntity>>> call(PaginationFilterEntity params) async {
    try {
      if (params.limit!.isNegative || params.limit == 0) {
        return Left(
          UserRepositoryLimitException(e: 'Limit cannot be negative or zero', stackTrace: StackTrace.current),
        );
      }

      if (params.page!.isNegative || params.page == 0) {
        return Left(UserRepositoryPageException(e: 'Page cannot be negative or zeo', stackTrace: StackTrace.current));
      }

      return _repository.findAll(params);
    } on UserRepositoryFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Future.error(Exception(e));
    }
  }
}
