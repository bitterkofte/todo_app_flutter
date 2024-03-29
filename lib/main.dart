import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // init the hive
  await Hive.initFlutter();
  // open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: Colors.teal,
          primaryColorLight: Colors.teal[300],
          primaryColorDark: Colors.teal[800],
          textTheme: GoogleFonts.poppinsTextTheme()),
    );
  }
}
