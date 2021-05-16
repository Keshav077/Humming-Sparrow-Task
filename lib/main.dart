import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humming_sparrow_task/screens/home.dart';
import 'package:humming_sparrow_task/screens/profile.dart';
import 'package:humming_sparrow_task/screens/video.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 26, 50, 43)));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 26, 50, 43),
      ),
      home: Home(),
      routes: {
        Home.routeName: (ctx) => Home(),
        Video.routeName: (ctx) => Video(),
        Profile.routeName: (ctx) => Profile(),
      },
    );
  }
}
