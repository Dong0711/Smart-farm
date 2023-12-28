// ignore_for_file: file_names

import 'package:farm/page/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:farm/components/My_button.dart';
import 'package:farm/components/My_text_field.dart';
import 'package:farm/components/Square_title.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool _showPass = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      //logo
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Container(
              width: screenWidth,
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/images/backgroundhome.png'),
                      fit: BoxFit.cover)),
              // child: Text('this is container'),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: MyTextField(
                controller: usernameController,
                hintText: 'Tên đăng nhập',
                obscureText: false,
                icon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                MyTextField(
                  controller: passwordController,
                  hintText: 'Mật khẩu',
                  obscureText: _showPass,
                  icon: const Icon(Icons.password),
                ),
                TextButton(
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      setState(() {
                        _showPass = !_showPass;
                      });
                    },
                    child: Icon(
                      _showPass ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ))
              ]),
            ),

            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Quên mật khẩu, tài khoản?',
                      style: TextStyle(color: Colors.grey),
                    )),
              ),
            ),
            SizedBox(
              height: 50,
            ),

            Mybutton(
              text: 'ĐĂNG NHẬP',
              fontSize: 20,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const MainPage()));
              },
            ),

            // padding: EdgeInsets.symmetric(horizontal: ),

            SizedBox(
              height: 30,
            ),
            //user input

            const Row(children: [
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
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: SquareTile(imagePath: 'lib/images/google.png')),
                SizedBox(
                  width: 40,
                ),
                TextButton(
                    onPressed: () {},
                    child: SquareTile(imagePath: 'lib/images/facebook.png')),
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chưa có tài khoản? ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Tạo ngay!',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
