import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hosn_candy_craft/register.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              padding: const EdgeInsets.fromLTRB(12,0,12,0),
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Email')
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              padding: const EdgeInsets.fromLTRB(12,0,12,0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text('Password')
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  login();
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
                  Get.to(()=>Register(),transition: Transition.rightToLeft, duration: const Duration(milliseconds: 700));
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
    );
  }


  void login() async {
      final usersBox = await Hive.openBox('users');
      if(usersBox.get(emailController.text) == null || usersBox.get(emailController.text)[1] == null){
        Get.snackbar("Invalid credentials", "Please enter your email and password",snackPosition: SnackPosition.BOTTOM);
      }
      if(usersBox.get(emailController.text).length != 0 && usersBox.get(emailController.text)[1] == passwordController.text){
        Get.off(()=>const Home(),transition: Transition.cupertino,duration: const Duration(milliseconds: 700));
      }else if(!usersBox.get(emailController.text).isBlank && (usersBox.get(emailController.text)[1] != passwordController.text || passwordController.text.isBlank!)){
        Get.snackbar("Invalid credentials", "Please check your password",snackPosition: SnackPosition.BOTTOM);
      }
      else{
        Get.snackbar("Invalid credentials", "Please check your email",snackPosition: SnackPosition.BOTTOM);
      }

  }
}
