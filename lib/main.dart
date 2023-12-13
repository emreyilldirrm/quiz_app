import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quiz_app/Flag_D_A_O.dart';
import 'package:quiz_app/Flags.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  home_page(),
    );
  }
}

class home_page extends StatefulWidget {

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Image.asset("image/img.png", // Bayrak resminin bulunduğu dosya yolunu belirtin
              height: 350,

              fit: BoxFit.contain,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => quize_screen()));
              },
              child: Text("Başla"),
            ),
          ],
        ),
      ),


    );
  }
}
