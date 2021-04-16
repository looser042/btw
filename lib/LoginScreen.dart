import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'HomeScreen.dart';
import 'SignupScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController number = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login(String phone, String password) async {
    Map value = {
      "mobile_no": phone,
      "password": password,
      "device_token": "abcd"
    };
    try {
      var url = Uri.http('stepin.btwbs.com', '/api/passenger-login');
      final responce = await http.post(url, body: value);
      var jsonData = json.decode(responce.body);
      var message = jsonData["message"];
      var rr=jsonData["status"];

      print(rr);
      if (jsonData["status"] == "null") {
        Fluttertoast.showToast(
          msg: '$rr',
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Color(0xffFFA756),
          fontSize: 15.0);

      }
      else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
         Fluttertoast.showToast(
          msg: '$message',
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Color(0xffFFA756),
          fontSize: 15.0);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: 700.0,
        width: 500.0,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              left: 40.0,
              top: 70.0,
              child: Container(
                height: 80.0,
                width: 250.0,
                color: Colors.white,
                child: Image.asset("asset/logo.png"),
              ),
            ),
            Positioned(
              left: 30.0,
              top: 200.0,
              child: Container(
                  height: 50.0,
                  width: 45.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.grey)],
                  ),
                  child: Icon(
                    Icons.call,
                    color: Colors.grey,
                  )),
            ),
            Positioned(
              left: 80.0,
              top: 200.0,
              child: Container(
                height: 50.0,
                width: 45.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.grey)],
                ),
                child: Center(
                    child: Text("+91", style: TextStyle(fontSize: 20.0))),
              ),
            ),
            Positioned(
              left: 130.0,
              top: 200.0,
              child: Container(
                padding: EdgeInsets.only(left: 7.0),
                height: 50.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.grey)],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Phone Number", border: InputBorder.none),
                  controller: number,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              top: 270.0,
              child: Container(
                padding: EdgeInsets.all(3.0),
                height: 50.0,
                width: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.grey)],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8.0,
                    ),
                    Image.asset(
                      "asset/pass.png",
                      height: 20.0,
                      width: 20.0,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: 50.0,
                      width: 250.0,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                        controller: pass,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              top: 350.0,
              child: Container(
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.grey)],
                ),
              ),
            ),
            Positioned(
              top: 355.0,
              left: 65.0,
              child: Text(
                "Remember Me",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Positioned(
              top: 355.0,
              left: 222.0,
              child: GestureDetector(
                child: Text(
                  "Forget Password ?",
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            Positioned(
              top: 400.0,
              left: 30.0,
              child: Container(
                height: 50.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7.0)),
                child: FlatButton(
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    login(number.text, pass.text);
                  },
                ),
              ),
            ),
            Positioned(
              top: 460,
              left: 170.0,
              child: Text("OR"),
            ),
            Positioned(
              top: 488.0,
              left: 30.0,
              child: Container(
                height: 50.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(7.0)),
                child: FlatButton(
                  child: Row(
                    children: [
                      Image.asset(
                        "asset/fb.png",
                        height: 20.0,
                      ),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        "CONNECT WITH FACEBOOK",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            Positioned(
              top: 630.0,
              left: 100.0,
              child: Text("Don't have an account?"),
            ),
            Positioned(
              top: 630.0,
              left: 220.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupScreen()));
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
