// ignore_for_file: avoid_unnecessary_containers


import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  Widget button({@required String name, Color color, Color textColor}){
    return Container(
                    height: 45,
                    width:300,
                    child: RaisedButton(
                      color: color,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.red, width: 2),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      onPressed: (){},
                      child: Text(
                        name,
                        style: TextStyle(color: textColor),
                        ),
                      ),
                  );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Center(
                child: Image.asset('images/logo.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Welcome to My app",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  Column(
                    children: [
                      Text("Order food from our restaurant and"),
                      Text("Make reservation in real time")
                    ],
                  ),
                  button(
                    name: "Login",
                    color: Colors.red,
                    textColor: Colors.white
                  ),
                  button(
                    name: "Sign up",
                    color: Colors.white,
                    textColor: Colors.red
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
