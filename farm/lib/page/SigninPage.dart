<<<<<<< Updated upstream
import 'package:farm/page/LoginPage.dart';
=======
import 'dart:html';

>>>>>>> Stashed changes
import 'package:farm/page/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:farm/components/My_button.dart';
import 'package:farm/components/My_text_field.dart';
import 'package:farm/components/Square_title.dart';
import 'package:farm/config/theme/AppColor.dart';
<<<<<<< Updated upstream
import 'package:farm/components/Mytext.dart';

class SigninPage extends StatefulWidget {
  SigninPage({super.key});

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

=======

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/images/Farm.png'))),
              // child: Text('this is container'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: MyText(
                text: 'ĐĂNG KÝ',
                color: AppColor.primary[90],
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: MyText(
                text: 'TRỞ THÀNH THÀNH VIÊN BẰNG CÁCH TẠO TÀI KHOẢN',
                color: AppColor.primary[90],
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: MyTextField(
                controller: usernameController,
                hintText: 'Tên đăng ký',
                obscureText: false,
                icon: Icon(Icons.person),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: MyTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
                icon: Icon(Icons.email),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                MyTextField(
                  controller: passwordController,
                  hintText: 'Mật khẩu',
                  obscureText: _showPass,
                  icon: Icon(Icons.password),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      onSurface: Colors.transparent,
                    ),
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
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                MyTextField(
                  controller: password1Controller,
                  hintText: 'Nhập lại mật khẩu',
                  obscureText: _showPass,
                  icon: Icon(Icons.password),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      onSurface: Colors.transparent,
                    ),
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
            SizedBox(
              height: 15,
=======
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
            MyTextField(
                controller: passwordController,
                hintText: 'Nhập lại mật khẩu',
                obscureText: false),
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
>>>>>>> Stashed changes
            ),

            Container(
              child: Mybutton(
                text: 'ĐĂNG KÝ',
                fontSize: 20,
                onPressed: () {
                  Navigator.of(context).pushReplacement(
<<<<<<< Updated upstream
                      MaterialPageRoute(builder: (context) => LoginPage()));
=======
                      MaterialPageRoute(builder: (context) => MainPage()));
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
              height: 20,
=======
              height: 50,
>>>>>>> Stashed changes
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
<<<<<<< Updated upstream
                  'ĐÃ CÓ TÀI KHOẢN? ',
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'ĐĂNG NHẬP NGAY!',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
=======
                  'ĐÃ CÓ TÀI KHOẢN ?',
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  'ĐĂNG NHẬP NGAY!',
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                )
              ],
            )

>>>>>>> Stashed changes
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
