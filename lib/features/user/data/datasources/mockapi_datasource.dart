import 'package:dio/dio.dart';
import 'package:get_test/features/user/data/datasources/user_datasources.dart';
import 'package:get_test/features/user/domain/entities/pagination_filter_entity.dart';
import 'package:get_test/features/user/data/models/user_model.dart';

class MockapiDataSource implements UserDatasource {
  Dio _dio;

  MockapiDataSource(this._dio);

  @override
  Future<List<UserModel>> getUsers(PaginationFilterEntity filter) async {
    try {
      final result = await _dio.get('/users');
      return List<Map<String, dynamic>>.from(result.data as List<dynamic>)
          .map((user) => UserModel.fromMap(user))
          .toList();
    } catch (e, stackTrace) {
      return Future.error(e, stackTrace);
    }
  }
}
