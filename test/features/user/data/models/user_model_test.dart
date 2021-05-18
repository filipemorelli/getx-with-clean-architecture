import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:get_test/features/user/data/models/user_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  UserModel sampleModel = UserModel(
    id: '1',
    name: 'Pasquale Wolff',
    username: 'Luis_Ward64',
  );

  group('Test Cryptos', () {
    final Map<String, dynamic> map = jsonDecode(fixture('user_model.json')) as Map<String, dynamic>;
    final String json = jsonEncode(map);

    test('should return a valid UserModel.fromJson', () {
      final UserModel fromJson = UserModel.fromJson(json);
      expect(sampleModel, fromJson);
    });

    test('should return a valid UserModel.fromMap', () {
      final UserModel fromMap = UserModel.fromMap(map);
      expect(sampleModel, fromMap);
    });

    test('should return a valid UserModel.toJson', () {
      expect(sampleModel.toJson(), json);
    });

    test('should return a valid UserModel.toMap', () {
      expect(sampleModel.toMap(), map);
    });
  });
}
