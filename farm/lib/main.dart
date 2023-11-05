import 'package:farm/page/ListFarmPage.dart';
import 'package:farm/page/LoginPage.dart';
import 'package:farm/page/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:farm/page/LoginPage.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale('vi'),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('vi'), // Vietnamese
        // Add more locales here
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open Sans'),
      home: MainPage(),
    );
  }
}
