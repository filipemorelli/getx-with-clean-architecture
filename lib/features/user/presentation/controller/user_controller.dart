import 'package:get/get.dart';
import 'package:get_test/features/user/domain/entities/pagination_filter_entity.dart';
import 'package:get_test/features/user/domain/entities/user_entity.dart';
import 'package:get_test/features/user/domain/usecases/get_users.dart';

class UserController extends GetxController {
  final GetUsersUserCase _getUsers;
  final _users = <UserEntity>[].obs;
  final _paginationFilter = PaginationFilterEntity().obs;
  final _lastPage = false.obs;

  List<UserEntity> get users => _users.toList();
  int get limit => _paginationFilter.value.limit ?? 15;
  int get _page => _paginationFilter.value.page ?? 1;
  bool get lastPage => _lastPage.value;

  UserController(
    this._getUsers,
  );

  @override
  void onInit() {
    ever(_paginationFilter, (_) => findUsers());
    _changePaginationFilter(1, 15);
    super.onInit();
  }

  Future<void> findUsers() async {
    final usersData = await _getUsers.call(_paginationFilter.value);
    usersData.fold((error) => null, (users) {
      _lastPage.value = users.isEmpty;
      _users.addAll(users);
    });
  }

  void changeTotalPerPage(int limitValue) {
    _users.clear();
    _lastPage.value = false;
    _changePaginationFilter(1, limitValue);
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void nextPage() => _changePaginationFilter(_page + 1, limit);
}
