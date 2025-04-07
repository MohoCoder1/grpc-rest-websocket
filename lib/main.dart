import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_hub/core/di.dart';
import 'package:task_hub/presentation/pages/intro_page.dart';

void main() {
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const IntroPage(),
    );
  }
}

