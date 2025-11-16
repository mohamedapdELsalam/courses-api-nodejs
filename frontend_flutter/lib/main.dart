import 'package:courses_app/core/constants/routes.dart';
import 'package:courses_app/core/services.dart';
import 'package:courses_app/core/themes/light_theme.dart';
import 'package:courses_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      getPages: myPages,
      locale: const Locale('ar'),
      initialRoute: AppRoutes.authScreen,
    );
  }
}
