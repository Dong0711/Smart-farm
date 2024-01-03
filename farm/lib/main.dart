import 'package:farm/firebase_api.dart';
import 'package:farm/firebase_options.dart';
import 'package:farm/page/WebsitePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:farm/page/LoginPage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('vi'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,  
      ],
      supportedLocales: const [
        Locale('vi'), // Vietnamese
        // Add more locales here
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Open Sans'),
      home: const LoginPage(),
      routes: {
        '/mainPage': (context) =>const WebSidePage(),
        // other routes...
      },
    );
  }
}
