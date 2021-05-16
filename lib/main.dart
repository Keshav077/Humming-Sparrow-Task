import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:humming_sparrow_task/screens/home.dart';
import 'package:humming_sparrow_task/screens/profile.dart';
import 'package:humming_sparrow_task/screens/video.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color.fromARGB(255, 26, 50, 43)));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primaryColor: Color.fromARGB(255, 26, 50, 43),
            textTheme: TextTheme(
                headline4: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                  color: Colors.black,
                ),
                headline5: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11.sp,
                  color: Colors.black,
                ),
                headline6: GoogleFonts.merriweather(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
                subtitle1: TextStyle(fontSize: 12.sp, color: Colors.grey),
                bodyText2: TextStyle(fontSize: 8.sp, color: Colors.white))),
        home: Home(),
        routes: {
          Home.routeName: (ctx) => Home(),
          Video.routeName: (ctx) => Video(),
          Profile.routeName: (ctx) => Profile(),
        },
      );
    });
  }
}
