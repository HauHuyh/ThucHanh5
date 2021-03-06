//@dart=2.9--no-sound-null-
import 'dart:async';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_overlay/loading_overlay.dart';

void main() => runApp(const HeroApp());

class HeroApp extends StatelessWidget {
  const HeroApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Transition Demo',
      home: const LoadingScreen(),
    );
  }
}

TextEditingController _email = new TextEditingController();
TextEditingController _password = new TextEditingController();
bool flag = false;
bool isChecked = false;
bool isChecked1 = false;
bool isChecked2 = false;
bool isChecked3 = false;
bool isChecked4 = false;
bool isChecked5 = false;
bool isChecked6 = false;
bool isChecked7 = false;
int tong = 0;
int soluong = 1;
const partern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
final regExp = RegExp(partern);

class FirstRoute extends StatelessWidget {
  const FirstRoute({Key? key}) : super(key: key);

//Trang chủ
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
                      });
                } else if (!regExp.hasMatch(_email.text)) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "Nhập sai Email",
                          ),
                        );
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
                      builder: (context) => LoadingCreen3Second(),
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

class Message extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(children: [
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
        ]),
      ),
    );
  }
}

class LoadingCreen3Second extends StatefulWidget {
  const LoadingCreen3Second({Key? key}) : super(key: key);

  @override
  _LoadingCreen3SecondState createState() => _LoadingCreen3SecondState();
}

//form Loading
class _LoadingCreen3SecondState extends State<LoadingCreen3Second> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoadingScreen()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
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
              SizedBox(
                height: 150,
              ),
              //Icon Loading
              SpinKitWave(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                        color: index.isEven ? Colors.white : Colors.green),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [LoadingScreenState()],
      ),
    );
  }
}

class LoadingScreenState extends StatefulWidget {
  const LoadingScreenState({Key? key}) : super(key: key);

  @override
  State<LoadingScreenState> createState() => _LoadingState();
}

class _LoadingState extends State<LoadingScreenState> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Column(
      children: [
        Container(
          color: Colors.grey.shade200,
          alignment: Alignment.centerRight,
          margin: EdgeInsets.only(right: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 200),
                child: Text(
                  "Mailboxes",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              Column(children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                      if (isChecked == true) {
                        isChecked1 = true;
                        isChecked2 = true;
                        isChecked3 = true;
                        isChecked4 = true;
                        isChecked5 = true;
                        isChecked6 = true;
                        isChecked7 = true;
                        tong = 7;
                      } else {
                        isChecked1 = false;
                        isChecked2 = false;
                        isChecked3 = false;
                        isChecked4 = false;
                        isChecked5 = false;
                        isChecked6 = false;
                        isChecked7 = false;
                        tong = 0;
                      }
                    });
                  },
                ),
                Text(
                  "DONE",
                  style: TextStyle(color: Colors.blue),
                )
              ]),
            ],
          ),
        ),
        Container(
          color: Colors.grey.shade300,
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
            child: Text("Mailboxes"),
          ),
        ),
        //All inboxes
        Row(
          children: [
            Column(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked1 = value!;

                      if (isChecked1 == true) {
                        tong += soluong;
                      } else {
                        tong -= soluong;
                      }
                    });
                  },
                ),
              ],
            ),
            Container(
              width: 450,
              margin: EdgeInsets.only(left: 18, top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: Row(
                children: [
                  Icon(Icons.check_box_outline_blank),
                  Container(
                    margin: EdgeInsets.only(left: 10, bottom: 15),
                    child: Text('All inboxes'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 300),
                    child: Text("4"),
                  )
                ],
              ),
            )
          ],
        ),
        //iCloud
        Row(
          children: [
            Column(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked2,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked2 = value!;
                      if (isChecked2 == true) {
                        tong += soluong;
                      } else {
                        tong -= soluong;
                      }
                    });
                  },
                ),
              ],
            ),
            Container(
              width: 450,
              margin: EdgeInsets.only(left: 18, top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: Row(
                children: [
                  Icon(Icons.cloud_circle),
                  Container(
                    margin: EdgeInsets.only(left: 8, bottom: 15),
                    child: Text('iCloud'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 330),
                    child: Text("1"),
                  )
                ],
              ),
            )
          ],
        ),
        //Gmail
        Row(
          children: [
            Column(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked3,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked3 = value!;
                      if (isChecked3 == true) {
                        tong += soluong;
                      } else {
                        tong -= soluong;
                      }
                    });
                  },
                ),
              ],
            ),
            Container(
              width: 450,
              margin: EdgeInsets.only(left: 18, top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: Row(
                children: [
                  Icon(Icons.mail_outline_outlined),
                  Container(
                    margin: EdgeInsets.only(left: 8, bottom: 15),
                    child: Text('Gmail'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 333),
                    child: Text("1"),
                  )
                ],
              ),
            )
          ],
        ),
        //Hot mail
        Row(
          children: [
            Column(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked4,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked4 = value!;
                      if (isChecked4 == true) {
                        tong += soluong;
                      } else {
                        tong -= soluong;
                      }
                    });
                  },
                ),
              ],
            ),
            Container(
              width: 450,
              margin: EdgeInsets.only(left: 18, top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: Row(
                children: [
                  Icon(Icons.mail_rounded),
                  Container(
                    margin: EdgeInsets.only(left: 8, bottom: 15),
                    child: Text('Hot mail'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 317),
                    child: Text("1"),
                  )
                ],
              ),
            )
          ],
        ),
        //Vip
        Row(
          children: [
            Column(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked5,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked5 = value!;
                      if (isChecked5 == true) {
                        tong += soluong;
                      } else {
                        tong -= soluong;
                      }
                    });
                  },
                ),
              ],
            ),
            Container(
              width: 450,
              margin: EdgeInsets.only(left: 18, top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: Row(
                children: [
                  Icon(Icons.people_alt_outlined),
                  Container(
                    margin: EdgeInsets.only(left: 8, bottom: 15),
                    child: Text('VIP'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 347),
                    child: Text("1"),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          color: Colors.grey.shade300,
          child: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(left: 10, top: 30, bottom: 5),
            child: Text("Special folders"),
          ),
        ),
        //Secure
        Row(
          children: [
            Column(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked6,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked6 = value!;
                      if (isChecked6 == true) {
                        tong += soluong;
                      } else {
                        tong -= soluong;
                      }
                    });
                  },
                ),
              ],
            ),
            Container(
              width: 450,
              margin: EdgeInsets.only(left: 18, top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: Row(
                children: [
                  Icon(Icons.security_rounded),
                  Container(
                    margin: EdgeInsets.only(left: 8, bottom: 15),
                    child: Text('Secure'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 328),
                    child: Text("1"),
                  )
                ],
              ),
            ),
          ],
        ),
        //Notifications
        Row(
          children: [
            Column(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.resolveWith(getColor),
                  value: isChecked7,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked7 = value!;
                      if (isChecked5 == true) {
                        tong += soluong;
                      } else {
                        tong -= soluong;
                      }
                    });
                  },
                ),
              ],
            ),
            Container(
              width: 450,
              margin: EdgeInsets.only(left: 18, top: 20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey))),
              child: Row(
                children: [
                  Icon(Icons.notification_add_outlined),
                  Container(
                    margin: EdgeInsets.only(left: 8, bottom: 15),
                    child: Text('Notifications'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 290),
                    child: Text("1"),
                  )
                ],
              ),
            ),
          ],
        ),

        //Delete
        Row(
          children: [
            Column(
              children: [
                Container(
                  width: 500,
                  margin: EdgeInsets.only(top: 150),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.blue))),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 440),
                        child: Text(tong.toString() + " item"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
