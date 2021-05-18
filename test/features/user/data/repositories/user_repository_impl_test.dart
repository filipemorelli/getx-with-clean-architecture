import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_test/features/user/data/datasources/user_datasources.dart';
import 'package:get_test/features/user/data/models/user_model.dart';
import 'package:get_test/features/user/data/repositories/user_repository_impl.dart';
import 'package:get_test/features/user/domain/entities/pagination_filter_entity.dart';
import 'package:get_test/features/user/errors/user_datasource_exception.dart';
import 'package:get_test/features/user/errors/user_failure.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import './user_repository_impl_test.mocks.dart';

@GenerateMocks(<Type>[UserDatasource])
void main() {
  late MockUserDatasource datasource;
  late UserRepositoryImpl repository;

  setUp(() {
    datasource = MockUserDatasource();
    repository = UserRepositoryImpl(datasource);
  });

  test('should return a list of UserModel', () async {
    when(datasource.getUsers(any)).thenAnswer((_) async => <UserModel>[]);
    final result = await repository.findAll(PaginationFilterEntity(page: 1, limit: 15));
    expect(result.isRight(), true);
    expect(result.fold(id, id), isA<List<UserModel>>());
  });

  test('should return an Exception', () async {
    when(datasource.getUsers(any)).thenThrow((_) => Exception());
    final result = await repository.findAll(PaginationFilterEntity(page: 1, limit: 15));
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<UserDatasourceException>());
  });
}
