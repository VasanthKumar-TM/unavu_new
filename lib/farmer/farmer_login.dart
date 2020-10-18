import 'package:flutter/material.dart';

import 'package:unavu_new/flogin/welcomePage.dart';

void main() => runApp(Farmer_Login());

class Farmer_Login extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Montserrat",
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
