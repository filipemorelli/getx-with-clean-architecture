import 'package:get_test/features/user/data/models/user_model.dart';
import 'package:get_test/features/user/domain/entities/pagination_filter_entity.dart';

abstract class UserDatasource {
  Future<List<UserModel>> getUsers(PaginationFilterEntity filter);
}
