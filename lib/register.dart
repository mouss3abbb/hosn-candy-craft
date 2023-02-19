import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: const Color(0xFF795F7A),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                child: Image.asset('assets/images/add_photo.png'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                padding: const EdgeInsets.fromLTRB(12,0,12,0),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Full name')
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: const EdgeInsets.fromLTRB(12,0,12,0),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Email')
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                padding: const EdgeInsets.fromLTRB(12,0,12,0),
                child: const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Password')
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(()=>const Home(),transition: Transition.cupertino,duration: const Duration(milliseconds: 700));
                  },
                  style: const ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(Color(0xFFEA9078)),
                      padding: MaterialStatePropertyAll(EdgeInsets.fromLTRB(34, 18, 34, 18)),
                      textStyle: MaterialStatePropertyAll(TextStyle(
                          fontSize: 20
                      )
                      )
                  ),
                  child: const Text("Register"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
