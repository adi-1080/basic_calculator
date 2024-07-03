import 'package:basic_calculator/views/calculator_view.dart';
import 'package:basic_calculator/views/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Learn",
      routes: {
        "/" : (context) => LoginPage(),
        "/calculator" : (context) => CalculatorView(),
      },
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      //home: const LoginPage(), //does not require home attribute here since default route is mentioned that is login page
      debugShowCheckedModeBanner: false,
    );
  
  }
}