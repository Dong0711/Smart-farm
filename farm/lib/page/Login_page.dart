// // ignore_for_file: prefer_const_constructors
// //import 'dart:js_util';
// import 'dart:ffi';

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:farm/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:farm/components/My_button.dart';
import 'package:farm/components/My_text_field.dart';
import 'package:farm/components/Square_title.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      //logo
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Container(
              width: screenWidth,
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/images/backgroundhome.png'),
                      fit: BoxFit.cover)),
              // child: Text('this is container'),
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            MyTextField(
                controller: usernameController,
                hintText: 'Tên đăng nhập',
                obscureText: false),
            SizedBox(
              height: 15,
            ),

            MyTextField(
                controller: passwordController,
                hintText: 'Mật khẩu',
                obscureText: true),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Quên mật khẩu, tài khoản?',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),

            Container(
              child: Mybutton(
                text: 'ĐĂNG NHẬP',
                fontSize: 20,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
            ),

            // padding: EdgeInsets.symmetric(horizontal: ),

            SizedBox(
              height: MediaQuery.of(context).size.width * 0.05,
            ),
            //user input

            Row(children: [
              Expanded(
                  child: Divider(
                thickness: 1,
                color: Colors.grey,
              )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  "Đăng nhập bằng phương thức khác",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Expanded(
                  child: Divider(
                thickness: 1,
                color: Colors.grey,
              )),
            ]
                // children: [Expanded(child: child)],
                ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imagePath: 'lib/images/google.png'),
                SizedBox(
                  width: 40,
                ),
                SquareTile(imagePath: 'lib/images/facebook.png'),
              ],
            ),
            SizedBox(
              height: 50,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chưa có tài khoản? ',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'Tạo ngay!',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            )

            //pass input

            //submit button

            // text

            //another
          ]),
        ),
      ),
    );
  }
}
