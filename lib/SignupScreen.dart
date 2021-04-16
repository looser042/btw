import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'HomeScreen.dart';
import 'LoginScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController pass = TextEditingController();
  Future register(String phone, String password,String email,String uname,) async {
    Map value = {
      "name":uname,
      "mobile_no": phone,
      "email":email,
      "password": password,
      "password_confirm":password,
      
    };
    try {
      var url = Uri.http('stepin.btwbs.com', '/api/passenger-register');
      final responce = await http.post(url, body: value);
      var jsonData = json.decode(responce.body);
      var message = jsonData["message"];
      var rr=jsonData["error"];
      print(message);
      if(phone ==null){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      Fluttertoast.showToast(
          msg: '$message',
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Color(0xffFFA756),
          fontSize: 15.0);}
          else{
            Fluttertoast.showToast(
          msg: '$rr',
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
              left: 30.0,
              top: 120.0,
              child: Container(
                padding: EdgeInsets.all(3.0),
                height: 50.0,
                width: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.grey)],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                  controller: name,
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              top: 190.0,
              child: Container(
                padding: EdgeInsets.all(3.0),
                height: 50.0,
                width: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [BoxShadow(blurRadius: 3.0, color: Colors.grey)],
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Colors.grey,
                    ),
                  ),
                  controller: mail,
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
            ),
            Positioned(
              left: 40.0,
              top: 20.0,
              child: Container(
                height: 80.0,
                width: 250.0,
                color: Colors.white,
                child: Image.asset("asset/logo.png"),
              ),
            ),
            Positioned(
              left: 30.0,
              top: 260.0,
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
              top: 260.0,
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
              top: 260.0,
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
                  keyboardType: TextInputType.number,
                  controller: number,
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              top: 330.0,
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
                        keyboardType: TextInputType.visiblePassword,
                        controller: pass,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              top: 400.0,
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
                      "asset/refr.png",
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
                            hintText: "Refereal Code(Optional)",
                            border: InputBorder.none,
                            suffixIcon: Icon(Icons.info_outline_rounded,),)
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 470.0,
              left: 30.0,
              child: Container(
                height: 50.0,
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(7.0)),
                child: FlatButton(
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    register(number.text, pass.text, mail.text, name.text);
                  },
                ),
              ),
            ),
            Positioned(
              top: 532,
              left: 170.0,
              child: Text("OR"),
            ),
            Positioned(
              top: 560.0,
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
                        "IMPORT FROM FACEBOOK",
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
              child: Text("Already have an account?"),
            ),
            Positioned(
              top: 630.0,
              left: 230.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              top: 650.0,
              left: 40.0,
              child: Text("By clicking sign up,You agree our"),
            ),
            Positioned(
              top: 650.0,
              left: 200.0,
              child: Text(
                "Terms and Conditions",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
