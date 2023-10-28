import 'package:farm/page/MainPage.dart';
import 'package:farm/page/SigninPage.dart';
import 'package:flutter/material.dart';
import 'package:farm/components/My_button.dart';
import 'package:farm/components/My_text_field.dart';
import 'package:farm/components/Square_title.dart';
import 'package:farm/config/theme/AppColor.dart';

class ForgotnamePage extends StatefulWidget {
  ForgotnamePage({super.key});

  @override
  State<ForgotnamePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<ForgotnamePage> {
  // text editing controllers
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  bool _showPass = true;

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
              height: screenHeight * 0.2,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/images/Forgotpass.png'),
                      fit: BoxFit.cover)),
              // child: Text('this is container'),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: MyTextField(
                controller: usernameController,
                hintText: 'NHẬP MẬT KHẨU MỚI',
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
                  hintText: 'XÁC NHẬN MẬT KHẨU',
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

            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 20,
                  ),
                ),
                Expanded(
                  child: Mybutton(
                    text: 'ĐĂNG NHẬP',
                    fontSize: 12,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => MainPage()));
                    },
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 1,
                  color: Colors.grey,
                )),
              ],
            ),
            // children: [Expanded(child: child)],

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
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SigninPage()));
                  },
                  child: Text(
                    'Tạo ngay!',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
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
