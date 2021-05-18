import 'package:dartz/dartz.dart';
import 'package:get_test/features/user/domain/entities/pagination_filter_entity.dart';
import 'package:get_test/features/user/domain/entities/user_entity.dart';
import 'package:get_test/features/user/domain/repositories/user_repository.dart';
import 'package:get_test/features/user/domain/usecases/usecase.dart';
import 'package:get_test/features/user/errors/user_failure.dart';
import 'package:get_test/features/user/errors/user_limit_exception.dart';
import 'package:get_test/features/user/errors/user_page_exception.dart';

abstract class GetUsersUserCase extends UseCase<List<UserEntity>, PaginationFilterEntity> {
  @override
  Future<Either<UserFailure, List<UserEntity>>> call(PaginationFilterEntity params);
}

class GetUsers implements GetUsersUserCase {
  UserRepository _repository;

  GetUsers(this._repository);

  @override
  Future<Either<UserFailure, List<UserEntity>>> call(PaginationFilterEntity params) async {
    try {
      if (params.limit!.isNegative || params.limit == 0) {
        return Left(
          UserLimitException(e: 'Limit cannot be negative or zero', stackTrace: StackTrace.current),
        );
      }

      if (params.page!.isNegative || params.page == 0) {
        return Left(UserPageException(e: 'Page cannot be negative or zeo', stackTrace: StackTrace.current));
      }

      return _repository.findAll(params);
    } on UserFailure catch (e) {
      return Left(e);
    } catch (e) {
      return Future.error(Exception(e));
    }
  }
}
