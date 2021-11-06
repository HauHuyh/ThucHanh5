import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(const HeroApp());

class HeroApp extends StatelessWidget {
  const HeroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Transition Demo',
      home: const FirstRoute(),
    );
  }
}

TextEditingController _email = new TextEditingController();
TextEditingController _password = new TextEditingController();
bool flag = false;

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

  bool XuLiEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
      return false;
    }
    return true;
  }

  void Login(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FirstRoute(),
      ),
    );
  }

  void DangNhapThatBai(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecondRoute(),
      ),
    );
  }

  bool KTEmail(String value) {
    if (value != "") {
      if (RegExp("^[a-zA-z0-9+_.-]+@[a-zA-z0-9.-]+.[a-z]")
          .hasMatch(_email.text)) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      backgroundColor: Colors.cyan,
      body: Center(
          child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 70, bottom: 20),
            child: SizedBox(
              height: 120,
              width: 120,
              child: Container(
                  child: FlatButton(
                onPressed: () {},
                color: Colors.white,
                child: Icon(
                  Icons.drafts_sharp,
                  size: 70,
                  color: Colors.lightBlue.shade200,
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0)),
              )),
            ),
          ),
          Container(
            child: Text(
              "SignIn",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          Container(
            child: Text(
              "Speak, friend, and enter",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 50),
              width: 425,
              child: Column(
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    controller: _email,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: Icon(
                          Icons.check_box_outline_blank,
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: 'Email'),
                  ),
                  // Checkbox(value: true, onChanged: (value) {}),
                  SizedBox(
                    height: 10,
                  ),

                  TextField(
                    textAlign: TextAlign.center,
                    obscureText: true,
                    controller: _password,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Password'),
                  ),
                ],
              )),
          Container(
            width: 425,
            height: 50,
            margin: EdgeInsets.only(top: 100),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.black, // background
              ),
              child: Text('SIGN IN',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              onPressed: () {
                // Navigate to second route when tapped.
                if (_email.text == "" && _password.text == "") {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "Chưa nhập thông tin",
                          ),
                        );
                        Login(context);
                      });
                } else if (_email.text != _password.text) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog();
                      });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondRoute(),
                    ),
                  );
                } else {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog();
                      });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoadingScreen(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      )),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TRY AGAIN"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 20),
              child: SizedBox(
                height: 120,
                width: 120,
                child: Container(
                    child: FlatButton(
                  onPressed: () {},
                  color: Colors.white,
                  child: Icon(
                    Icons.drafts_sharp,
                    size: 70,
                    color: Colors.lightBlue.shade200,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)),
                )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: Text(
                "USP...coundn't Sign in",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: Text(
                "Your username and password don't match.",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 2),
              child: Text(
                "Please, try again",
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 15,
                ),
              ),
            ),
            Container(
              width: 425,
              height: 50,
              margin: EdgeInsets.only(top: 250, bottom: 94),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // background
                ),
                child: Text('TRY AGAIN',
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: () {
                  // Navigate to second route when tapped.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FirstRoute(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 20),
              child: SizedBox(
                height: 120,
                width: 120,
                child: Container(
                    child: FlatButton(
                  onPressed: () {},
                  color: Colors.white,
                  child: Icon(
                    Icons.drafts_sharp,
                    size: 70,
                    color: Colors.lightBlue.shade200,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60.0)),
                )),
              ),
            ),
            Container(
              child: Text(
                "SignIn",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              child: Text(
                "Speak, friend, and enter",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
