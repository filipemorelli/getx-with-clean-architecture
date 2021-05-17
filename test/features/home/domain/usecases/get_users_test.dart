import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_test/features/home/domain/entities/pagination_filter_entity.dart';
import 'package:get_test/features/home/domain/entities/user_entity.dart';
import 'package:get_test/features/home/domain/repositories/user_repository.dart';
import 'package:get_test/features/home/domain/usecases/get_users.dart';
import 'package:get_test/features/home/errors/user_repository_limit_exception%20copy.dart';
import 'package:get_test/features/home/errors/user_repository_page_exception.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import './get_users_test.mocks.dart';

@GenerateMocks(<Type>[UserRepository])
void main() {
  late MockUserRepository repository;
  late GetUsers usecase;

  setUp(() {
    repository = MockUserRepository();
    usecase = GetUsers(repository);
  });

  test('should return list of users', () async {
    when(repository.findAll(any)).thenAnswer((_) async => Right(<UserEntity>[]));
    final users = await usecase.call(PaginationFilterEntity(page: 1, limit: 15));
    expect(users.isRight(), true);
    expect(users.fold(id, id), isA<List<UserEntity>>());
  });

  test('should return an error UserRepositoryLimitException when limit is 0', () async {
    when(repository.findAll(any)).thenAnswer((_) async => Right(<UserEntity>[]));
    final users = await usecase.call(PaginationFilterEntity(page: 1, limit: 0));
    expect(users.isLeft(), true);
    expect(users.fold(id, id), isA<UserRepositoryLimitException>());
  });

  test('should return an error UserRepositoryLimitException when limit is negative', () async {
    when(repository.findAll(any)).thenAnswer((_) async => Right(<UserEntity>[]));
    final users = await usecase.call(PaginationFilterEntity(page: 1, limit: -1));
    expect(users.isLeft(), true);
    expect(users.fold(id, id), isA<UserRepositoryLimitException>());
  });

  test('should return an error UserRepositoryPageException when page is 0', () async {
    when(repository.findAll(any)).thenAnswer((_) async => Right(<UserEntity>[]));
    final users = await usecase.call(PaginationFilterEntity(page: 0, limit: 15));
    expect(users.isLeft(), true);
    expect(users.fold(id, id), isA<UserRepositoryPageException>());
  });

  test('should return an error UserRepositoryPageException when page is negative', () async {
    when(repository.findAll(any)).thenAnswer((_) async => Right(<UserEntity>[]));
    final users = await usecase.call(PaginationFilterEntity(page: 0, limit: 15));
    expect(users.isLeft(), true);
    expect(users.fold(id, id), isA<UserRepositoryPageException>());
  });
}
