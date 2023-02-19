import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hosn_candy_craft/splash_screen.dart';

late final BoxCollection collection;
void main() async {
  await Hive.initFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {


  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Scaffold(
        body: SplashScreen(),
      ),
    );
  }
}
