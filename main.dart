import 'package:fapp/Pages/LoginPage.dart';
import 'package:fapp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Pages/HomePage.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Home_Page(),
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // primaryTextTheme: GoogleFonts.leptonTextTheme()
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      // debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.home,
      routes: {
        MyRoutes.home:(context)=>const Home_Page(),
        "/": (context)=>const Login_Page(),
        MyRoutes.login: (context)=>const Login_Page(),


      },
    );
  }
}

