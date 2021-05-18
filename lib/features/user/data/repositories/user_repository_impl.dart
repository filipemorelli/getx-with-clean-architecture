import 'package:dartz/dartz.dart';
import 'package:get_test_sample/features/user/data/datasources/user_datasources.dart';
import 'package:get_test_sample/features/user/domain/entities/user_entity.dart';
import 'package:get_test_sample/features/user/domain/entities/pagination_filter_entity.dart';
import 'package:get_test_sample/features/user/domain/repositories/user_repository.dart';
import 'package:get_test_sample/features/user/errors/user_datasource_exception.dart';
import 'package:get_test_sample/features/user/errors/user_failure.dart';

class UserRepositoryImpl implements UserRepository {
  UserDatasource _datasource;

  UserRepositoryImpl(this._datasource);

  @override
  Future<Either<UserFailure, List<UserEntity>>> findAll(PaginationFilterEntity filter) async {
    try {
      final result = await _datasource.getUsers(filter);
      return Right(result);
    } catch (e, stackTrace) {
      return Left(UserDatasourceException(e: e, stackTrace: stackTrace));
    }
  }
}
