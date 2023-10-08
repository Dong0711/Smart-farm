import 'package:farm/components/BottomBar.dart';
import 'package:farm/page/VideoPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = "áda";
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            print(selectedIndex);
            text = 'home';
          });
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => VideoPage()));
        },
        index: selectedIndex,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Text(text),
        ),
      ),
    );
  }
}
