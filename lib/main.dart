import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_test_sample/application/bindings/application_bindings.dart';
import 'package:get_test_sample/features/user/presentation/bindings/user_bindings.dart';
import 'package:get_test_sample/i18n/messages.dart';

import 'features/user/presentation/pages/user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: ApplicationBinding(),
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en_US'),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: '/',
          binding: UserBindings(),
          page: () => UserPage(Get.find()),
        ),
      ],
    );
  }
}
