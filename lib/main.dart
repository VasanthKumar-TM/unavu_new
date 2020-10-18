import 'package:flutter/material.dart';
import 'package:unavu_new/SizeConfig.dart';
import 'farmerOrCustomer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        // '/AnimatedSplashScreen': (BuildContext context) =>
        //     AnimatedSplashScreen(),
        '/FarmerOrConsumer': (BuildContext context) => FarmerOrConsumer(),
      },
      home: FarmerOrConsumer(),
    );
  }
}
