import 'package:dio/dio.dart';
import 'package:get_test_sample/features/user/data/datasources/user_datasources.dart';
import 'package:get_test_sample/features/user/domain/entities/pagination_filter_entity.dart';
import 'package:get_test_sample/features/user/data/models/user_model.dart';
import 'package:get_test_sample/features/user/errors/user_datasource_exception.dart';

class MockapiDataSource implements UserDatasource {
  Dio _dio;

  MockapiDataSource(this._dio);

  @override
  Future<List<UserModel>> getUsers(PaginationFilterEntity filter) async {
    try {
      final result = await _dio.get('/users', queryParameters: {
        'limit': filter.limit,
        'page': filter.page,
      });
      return List<Map<String, dynamic>>.from(result.data as List<dynamic>)
          .map((user) => UserModel.fromMap(user))
          .toList();
    } catch (e, stackTrace) {
      return Future<List<UserModel>>.error(UserDatasourceException(e: e, stackTrace: stackTrace), stackTrace);
    }
  }
}
