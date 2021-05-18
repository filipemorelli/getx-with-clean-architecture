import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_test_sample/features/user/data/datasources/mockapi_datasource.dart';
import 'package:get_test_sample/features/user/data/models/user_model.dart';
import 'package:get_test_sample/features/user/domain/entities/pagination_filter_entity.dart';
import 'package:get_test_sample/features/user/errors/user_datasource_exception.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late MockapiDataSource dataSource;
  late PaginationFilterEntity filter;
  late List<dynamic> userSuccessPayload;

  setUp(() {
    dioAdapter = DioAdapter();
    dio = Dio(BaseOptions(baseUrl: ''))..httpClientAdapter = dioAdapter;
    dataSource = MockapiDataSource(dio);
    userSuccessPayload = jsonDecode(fixture('mockapi_datasource.json')) as List<dynamic>;
    filter = PaginationFilterEntity(page: 1, limit: 10);
  });

  test('should return list of users', () async {
    dioAdapter.onGet(
      '/users',
      (request) => request.reply(200, userSuccessPayload),
      queryParameters: {
        'page': filter.page,
        'limit': filter.limit,
      },
    );

    final result = await dataSource.getUsers(filter);
    expect(result, isA<List<UserModel>>());
  });

  test('should return datasource error', () async {
    dioAdapter.onGet(
      '/users',
      (request) => request.reply(500, DioError(requestOptions: RequestOptions(path: ''))),
      queryParameters: {
        'page': filter.page,
        'limit': filter.limit,
      },
    );

    final result = dataSource.getUsers(filter);
    expect(result, throwsA(isA<UserDatasourceException>()));
  });
}
