// ignore_for_file: file_names

import 'package:farm/page/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:farm/components/My_button.dart';
import 'package:farm/components/My_text_field.dart';
import 'package:farm/components/Square_title.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/components/Mytext.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final password1Controller = TextEditingController();

  bool _showPass = true;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      //logo
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: MyText(
              text: 'ĐĂNG KÝ',
              color: AppColor.primary[90],
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: MyText(
              text: 'TRỞ THÀNH THÀNH VIÊN BẰNG CÁCH TẠO TÀI KHOẢN',
              color: AppColor.primary[90],
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MyTextField(
              controller: usernameController,
              hintText: 'Tên đăng ký',
              obscureText: false,
              icon: const Icon(Icons.person),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
              icon: const Icon(Icons.email),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
              MyTextField(
                controller: password1Controller,
                hintText: 'Nhập lại mật khẩu',
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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

          Mybutton(
            text: 'ĐĂNG KÝ',
            fontSize: 20,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
              // MaterialPageRoute(builder: (context) => MainPage()));
            },
          ),

          // padding: EdgeInsets.symmetric(horizontal: ),

          SizedBox(
            height: MediaQuery.of(context).size.width * 0.05,
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
            height: screenHeight * 0.04,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SquareTile(imagePath: 'lib/images/google.png'),
              SizedBox(
                width: 40,
              ),
              SquareTile(imagePath: 'lib/images/facebook.png'),
            ],
          ),
          const SizedBox(
            height: 50,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'ĐÃ CÓ TÀI KHOẢN? ',
                style: TextStyle(color: Colors.grey),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const LoginPage()));
                },
                child: const Text(
                  'ĐĂNG NHẬP NGAY!',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),

          //pass input

          //submit button

          // text

          //another
        ]),
      ),
    );
  }
}
