import 'package:dartz/dartz.dart';
import 'package:get_test_sample/features/user/domain/entities/pagination_filter_entity.dart';
import 'package:get_test_sample/features/user/domain/entities/user_entity.dart';
import 'package:get_test_sample/features/user/errors/user_failure.dart';

abstract class UserRepository {
  Future<Either<UserFailure, List<UserEntity>>> findAll(PaginationFilterEntity filter);
}
