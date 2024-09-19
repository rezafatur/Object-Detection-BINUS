import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(
    const Duration(
      milliseconds: 300,
    ),
  );

  runApp(
    GetMaterialApp(
      title: "Object Detection - BINUS",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
