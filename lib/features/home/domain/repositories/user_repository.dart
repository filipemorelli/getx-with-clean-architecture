import 'package:dartz/dartz.dart';
import 'package:get_test/features/home/domain/entities/pagination_filter_entity.dart';
import 'package:get_test/features/home/domain/entities/user_entity.dart';
import 'package:get_test/features/home/errors/user_repository_failure.dart';

abstract class UserRepository {
  Future<Either<UserRepositoryFailure, List<UserEntity>>> findAll(PaginationFilterEntity filter);
}
