// Mocks generated by Mockito 5.0.7 from annotations
// in get_test/test/features/home/data/repositories/user_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:get_test/features/home/data/datasources/user_datasources.dart'
    as _i2;
import 'package:get_test/features/home/data/models/user_model.dart' as _i4;
import 'package:get_test/features/home/domain/entities/pagination_filter_entity.dart'
    as _i5;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

// ignore_for_file: prefer_const_constructors

// ignore_for_file: avoid_redundant_argument_values

/// A class which mocks [UserDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserDatasource extends _i1.Mock implements _i2.UserDatasource {
  MockUserDatasource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.UserModel>> getUsers(
          _i5.PaginationFilterEntity? filter) =>
      (super.noSuchMethod(Invocation.method(#getUsers, [filter]),
              returnValue: Future<List<_i4.UserModel>>.value(<_i4.UserModel>[]))
          as _i3.Future<List<_i4.UserModel>>);
}
