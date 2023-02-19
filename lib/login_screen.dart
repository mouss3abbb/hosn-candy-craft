import 'package:flutter/material.dart';
import 'package:hosn_candy_craft/register.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF9D8B9D),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
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
                    Get.off(()=>const Home(),transition: Transition.cupertino,duration: const Duration(milliseconds: 700));
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
                  child: const Text("Login"),
                ),
              ),
              TextButton(
                  onPressed: (){
                    Get.to(()=>const Register(),transition: Transition.rightToLeft, duration: const Duration(milliseconds: 700));
                  },
                  child: const Text(
                      "Register",
                    style: TextStyle(
                      color: Color(0xFF795F7A),
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
