import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_test/features/home/domain/entities/pagination_filter_entity.dart';
import 'package:get_test/features/home/domain/entities/user_entity.dart';
import 'package:get_test/features/home/domain/repositories/user_repository.dart';
import 'package:get_test/features/home/domain/usecases/get_users.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import './get_users_test.mocks.dart';

@GenerateMocks(<Type>[UserRepository])
void main() {
  late MockUserRepository repository;
  late GetUsers usecase;
  late PaginationFilterEntity filterOk;

  setUp(() {
    repository = MockUserRepository();
    usecase = GetUsers(repository);
    filterOk = PaginationFilterEntity(page: 1, limit: 15);
  });

  test('should return list of users', () async {
    when(repository.findAll(any)).thenAnswer((_) async => Right(<UserEntity>[]));
    final users = await usecase.call(filterOk);
    expect(users.isRight(), true);
    expect(users.fold(id, id), isA<List<UserEntity>>());
  });
}
