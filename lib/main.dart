import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'homePage.dart';

void main() async {
  await Hive.initFlutter();

  // ignore: unused_local_variable
  var myBox = await Hive.openBox('Box');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF390000)),
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const HomePage(),
    );
  }
}
