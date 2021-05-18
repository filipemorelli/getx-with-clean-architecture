// Mocks generated by Mockito 5.0.7 from annotations
// in get_test/test/features/user/domain/usecases/get_users_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:get_test/features/user/domain/entities/pagination_filter_entity.dart'
    as _i7;
import 'package:get_test/features/user/domain/entities/user_entity.dart' as _i6;
import 'package:get_test/features/user/domain/repositories/user_repository.dart'
    as _i3;
import 'package:get_test/features/user/errors/user_failure.dart' as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

class _FakeEither<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [UserRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserRepository extends _i1.Mock implements _i3.UserRepository {
  MockUserRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.UserFailure, List<_i6.UserEntity>>> findAll(
          _i7.PaginationFilterEntity? filter) =>
      (super.noSuchMethod(Invocation.method(#findAll, [filter]),
          returnValue:
              Future<_i2.Either<_i5.UserFailure, List<_i6.UserEntity>>>.value(
                  _FakeEither<_i5.UserFailure, List<_i6.UserEntity>>())) as _i4
          .Future<_i2.Either<_i5.UserFailure, List<_i6.UserEntity>>>);
}