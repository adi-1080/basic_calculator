import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {

  num x = 0;
  num y = 0;
  num z = 0;

  final xController = TextEditingController();
  final yController = TextEditingController();
  final angleController = TextEditingController();

  FocusNode xFocusNode = FocusNode();
  FocusNode yFocusNode = FocusNode();
  FocusNode angleFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    xController.text = x.toString();
    yController.text = y.toString();
  }

  @override
  void dispose() {
    xController.dispose();
    yController.dispose();
    xFocusNode.dispose();
    yFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      backgroundColor: Color.fromRGBO(241, 238, 238, 1.0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //HideKeyBoard(),
              Display(hint: "Enter 1st number", controller: xController, focusNode: xFocusNode,),
              SizedBox(height: 10,),
              Display(hint: "Enter 2nd number", controller: yController, focusNode: yFocusNode),
              SizedBox(height: 15,),
              Display(hint: "Enter ∠ between two vectors(optional)", controller: angleController, focusNode: angleFocusNode, readOnly: false,),
              SizedBox(height: 10,),

              Text(
                "$z",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                //fontFamily: ,
              ),
              ),

              SizedBox(height: 10,),

              Column(
                children: [
                Column(
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        createNumButton("1",xFocusNode,yFocusNode,xController,yController),
                        createNumButton("2",xFocusNode,yFocusNode,xController,yController),
                        createNumButton("3",xFocusNode,yFocusNode,xController,yController),

                    ],
                  ),
                ],
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        createNumButton("4",xFocusNode,yFocusNode,xController,yController),
                        createNumButton("5",xFocusNode,yFocusNode,xController,yController),
                        createNumButton("6",xFocusNode,yFocusNode,xController,yController),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        createNumButton("7",xFocusNode,yFocusNode,xController,yController),
                        createNumButton("8",xFocusNode,yFocusNode,xController,yController),
                        createNumButton("9",xFocusNode,yFocusNode,xController,yController),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        createNumButton("0",xFocusNode,yFocusNode,xController,yController),
                        createNumButton("Back",xFocusNode,yFocusNode,xController,yController),
                        FloatingActionButton(
                          backgroundColor: Colors.lightBlueAccent,
                          onPressed: (){
                            setState(() {
                        x = 0;
                        y = 0;
                        z = 0;
                        xController.clear();
                        yController.clear();
                        });
                        },
                        child:

                        Text(
                          "AC",
                          style: TextStyle(
                          color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  children: [
                    createNumButton(".",xFocusNode,yFocusNode,xController,yController),
                  ],
                ),
                  SizedBox(height: 10,),
              ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                       z = num.tryParse(xController.text)! + num.tryParse(yController.text)!;
                        //print(z);
                      });
                    },
                    child: Icon(CupertinoIcons.add),
                    backgroundColor: Colors.lightBlueAccent,
                    ),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        z = num.tryParse(xController.text)! - num.tryParse(yController.text)!;
                        //print(z);
                      });
                    },
                    child: Icon(CupertinoIcons.minus),
                    backgroundColor: Colors.lightBlueAccent,
                    ),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        z = num.tryParse(xController.text)! * num.tryParse(yController.text)!;
                        //print(z);
                      });
                    },
                    child: Icon(CupertinoIcons.multiply),
                    backgroundColor: Colors.lightBlueAccent,
                    ),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        z = num.tryParse(xController.text)! / num.tryParse(yController.text)!;
                        //print(z);
                      });
                    },
                    child: Icon(CupertinoIcons.divide),
                    backgroundColor: Colors.lightBlueAccent,
                    ),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        z = num.tryParse(xController.text)! % num.tryParse(yController.text)!;
                        //print(z);
                      });
                    },
                    child: Icon(CupertinoIcons.percent),
                    backgroundColor: Colors.lightBlueAccent,
                    ),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        const double pi = 3.1415926535897932;
                        // if(angleController.text.isEmpty){
                        //   angleController.text = "90"; //If user doesn't inputs angle field, we assume the two vector to be perpendicular hence we consider angleController.text to be 90 degrees by default
                        // }
                        num x_sq = num.tryParse(xController.text)! * num.tryParse(xController.text)!;
                        num y_sq = num.tryParse(yController.text)! * num.tryParse(yController.text)!;
                        num x_y_cos_2 = 2 * num.tryParse(xController.text)! * num.tryParse(yController.text)! * cos( ( num.tryParse(angleController.text)! * pi ) / 180 );
                        num x_y_sq_add = x_sq + y_sq + x_y_cos_2;
                        z = sqrt(x_y_sq_add);
                        //print(z);
                      });
                    },
                    backgroundColor: Colors.blue.shade200,
                    child: Image.asset('assets/vectorIcon.png'),
                    ),
                ],
              ),
            ],
            ),
        ),
      ),
    );
  }
}

//Use extract method
class Display extends StatelessWidget {
  const Display({
    super.key,
    this.hint = "Enter a number",
    required this.controller,
    required this.focusNode,
    this.readOnly = true,
  });

  final String? hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        focusNode.unfocus();
      },
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        readOnly: readOnly, // disables keyboard popup when input text field
        keyboardType: TextInputType.number,
        autofocus: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.black,
              width: 3.0,
            ),
          ),
          //labelText: "0",
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.black,
          )
        ),
      ),
    );
  }
}

//Use extract flutter widget
Widget createNumButton(String text, FocusNode xFocusNode, FocusNode yFocusNode, TextEditingController xController, TextEditingController yController){
  return FloatingActionButton(
    backgroundColor: Colors.lightBlueAccent,
    onPressed: (){
      if(text == "Back"){
        if(xFocusNode.hasFocus){
          if(xController.text.isNotEmpty){
            xController.text = xController.text.substring(0, xController.text.length - 1);
          }
        }
        else if(yFocusNode.hasFocus){
          if(yController.text.isNotEmpty){
            yController.text = yController.text.substring(0, yController.text.length -1);
          }
        }
      }
      else{
        if(xFocusNode.hasFocus){
          xController.text += text;
        }
        else if(yFocusNode.hasFocus){
          yController.text += text;
        }
      }
    },
    child:
    Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}
