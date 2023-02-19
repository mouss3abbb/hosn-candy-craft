import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(
        const Duration(seconds: 3),(){
          Get.off(()=>const Login(),transition: Transition.circularReveal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFEA9078),
      child: Center(
        child: Image.asset('assets/images/hosn_logo.png'),
      ),
    );
  }
}
