import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_test/features/user/presentation/controller/user_controller.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class UserPage extends StatelessWidget {
  final UserController _controller;

  const UserPage(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('user_title'.tr),
        actions: [
          PopupMenuButton<int>(
            initialValue: _controller.limit,
            icon: Icon(Icons.more_vert),
            onSelected: (int value) => _controller.changeTotalPerPage(value),
            itemBuilder: (context) {
              return <PopupMenuEntry<int>>[
                CheckedPopupMenuItem(
                  value: 15,
                  checked: _controller.limit == 15,
                  child: Text('user_options'.trParams({'limit': '15'})!),
                ),
                CheckedPopupMenuItem(
                  value: 20,
                  checked: _controller.limit == 20,
                  child: Text('user_options'.trParams({'limit': '20'})!),
                ),
                CheckedPopupMenuItem(
                  value: 50,
                  checked: _controller.limit == 50,
                  child: Text('user_options'.trParams({'limit': '50'})!),
                ),
              ];
            },
          )
        ],
      ),
      body: Obx(
        () => LazyLoadScrollView(
          onEndOfPage: () => _controller.nextPage(),
          isLoading: _controller.lastPage,
          child: ListView.builder(
            itemCount: _controller.users.length,
            itemBuilder: (context, index) {
              final user = _controller.users[index];
              return ListTile(
                leading: Text(user.id),
                title: Text(user.name),
                subtitle: Text(user.username),
              );
            },
          ),
        ),
      ),
    );
  }
}
