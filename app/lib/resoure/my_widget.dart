import 'dart:async';

import 'package:flutter/material.dart';

import '../bloc/bloc_input.dart';
import 'home.dart';


bool Showpass = false;
TextEditingController _userController = TextEditingController();
TextEditingController _passController = TextEditingController();
/* String _userTextChange = '';
String _passTextChange = ''; */

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  StreamController<String> username = StreamController<String>();
  @override
  Widget build(BuildContext context) {
    void OnToggleShowPass() {
      setState(() {
        Showpass = !Showpass;
      });
    }

    blocInput bloc = new blocInput();
    void _SignInOnclick() {
      if (bloc.isValidInfo(_userController.text, _passController.text)){
        Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      /* setState(() {
        if (_userController.text.length < 6 || !_userTextChange.contains('@')) {
          _userInvalid = true;
        } else
          _userInvalid = false;
        if (_passController.text.length < 6) {
          _passInvalid = true;
        } else
          _passInvalid = false;
        if (!_userInvalid && !_passInvalid) {
          /* Navigator.push(context, MaterialPageRoute(builder: (homePage))); */
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        }
      }); */
    }
    /*  Widget homePage(BuildContext context) {
      return HomePage();
    } */
    print('object');
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.amber),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlutterLogo(),
                ),
              ),
              const Text(
                'Hello \nWellcome Back',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: StreamBuilder(
                  stream: bloc.username,
                  builder: (context, snapshot) => TextField(
                    controller: _userController,
                    /* onChanged: (userText) {
                      _userTextChange = userText;
                      if (_userTextChange.isEmpty) {
                        setState(() {
                          _userInvalid =
                              false; // Kiểm tra textfild có trống không
                        });
                      }
                    }, */
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error.toString() : null,
                        label: const Text(
                          'Tên đăng nhập',
                          style: TextStyle(color: Colors.grey),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child:
                    Stack(alignment: AlignmentDirectional.centerEnd, children: [
                  StreamBuilder(
                    stream: bloc.password,
                    builder: (context, snapshot) => TextField(
                      controller: _passController,
                      /* onChanged: (passText) {
                        _userTextChange = passText;
                        if (_userTextChange.isEmpty) {
                          setState(() {
                            _passInvalid =
                                false; // Kiểm tra textfild có trống không
                          });
                        }
                      }, */
                      decoration: InputDecoration(
                          errorText: snapshot.hasError ? snapshot.error.toString() : null,
                          label: const Text('Mật khẩu',
                              style: TextStyle(color: Colors.grey)),
                          border: const OutlineInputBorder()),
                      obscureText: !Showpass,
                    ),
                  ),
                  GestureDetector(
                    onTap: OnToggleShowPass,
                    child: Text(
                      !Showpass ? 'SHOW' : 'HIDE',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _SignInOnclick,
                    child: Text('SIGN IN'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'NEW USER?  SIGN UP',
                      style: TextStyle(fontSize: 14),
                    ),
                    Text(
                      'FORGOT PASSWORD',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
