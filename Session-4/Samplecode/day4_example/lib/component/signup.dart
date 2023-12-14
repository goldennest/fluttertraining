import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class SignnWidget extends StatefulWidget {
  const SignnWidget({super.key});

  @override
  State<SignnWidget> createState() => _SignnWidgetState();
}

class _SignnWidgetState extends State<SignnWidget> {
  GlobalKey<FormState> fromkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _register(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String email = _emailController.text;
    String password = _passController.text;
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    Navigator.pushAndRemoveUntil(
        fromkey.currentContext!,
        MaterialPageRoute(
            builder: (context) => const LoginWidget()),
        (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.lightGreen[900],
            child: const Center(
                child: Text("Sign Up",
                    style: TextStyle(fontSize: 48, color: Colors.white))),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: fromkey,
              child: Column(
                children: [
                  emailadd(),
                  pass(),
                  phone(),
                  zip(),
                  register(),
                  backlogin(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }

  emailadd() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextFormField(
            controller: _emailController,
            validator: (emailvalue) {
              if (emailvalue!.isEmpty) {
                return "Please enter your email";
              } else if (RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(emailvalue)) {
                return null;
              }
              return "invalid email";
            },
            decoration: const InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }

  pass() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextFormField(
            controller: _passController,
            obscureText: true,
            validator: (namevalue) {
              if (namevalue!.isEmpty) {
                return "please enter your Password";
              } else if (namevalue.length > 10) {
                return "name should not exceed 8 characters";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }

  phone() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextFormField(
            validator: (phonevalue) {
              if (phonevalue!.isEmpty) {
                return "Enter your number";
              } else if (phonevalue.length > 12) {
                return "Please enter valid number";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: "Phone Number",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }

  zip() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: TextFormField(
            validator: (zipvalue) {
              if (zipvalue!.isEmpty) {
                return "Enter your zipcode";
              } else if (zipvalue.length > 12) {
                return "Please enter valid number";
              }
              return null;
            },
            decoration: const InputDecoration(
                hintText: "Zip Code",
                prefixIcon: Icon(Icons.location_city),
                border: OutlineInputBorder()),
          ),
        ),
      ],
    );
  }

  register() {
    return Padding(
        padding: const EdgeInsets.only(top: 5),
        child: ElevatedButton(
          onPressed: () {
            if (fromkey.currentState!.validate()) {
              _register(context);
            }
          },
          child: const Text(
            ("Register"),
          ),
        ));
  }

  backlogin() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                       const LoginWidget()),
                (_) => false);
          },
          child: const Text("Back to login")),
    );
  }
}
