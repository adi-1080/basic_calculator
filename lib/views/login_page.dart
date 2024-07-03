import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        width: double.infinity,
        height: double.infinity,
        //color: CupertinoColors.activeBlue, //cannot provide a color and a image simultaneously
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.darken,
          image: DecorationImage(
            image: AssetImage('assets/calculator.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              CupertinoColors.systemGrey.withOpacity(0.5), BlendMode.saturation,
            ),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Center(
                key: const Key('centreLogoKey'),
                child: Container(
                  width: 100,
                  height: 100,
                  child: const Image(
                    image: AssetImage('assets/logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 10,),

              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, "/calculator");
                },
                child: Text('Go To Calculator'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
