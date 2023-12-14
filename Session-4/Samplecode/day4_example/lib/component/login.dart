import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../landingpage.dart';
import '../simplelandingpage.dart';
import 'signup.dart';

class LoginWidget extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginWidget({Key? key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> _login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedEmail = prefs.getString('email') ?? '';
    String storedPassword = prefs.getString('password') ?? '';

    String enteredEmail = _emailController.text;
    String enteredPassword = _passwordController.text;

    if (enteredEmail == storedEmail && enteredPassword == storedPassword) {
      await prefs.setBool('isloggedin', true);
      Navigator.pushAndRemoveUntil(
          _scaffoldKey.currentContext!,
              MaterialPageRoute(builder: (_) => LandingPage(email: enteredEmail)),

          // MaterialPageRoute(builder: (_) => SimpleLandingPage(email: enteredEmail)),
          (_) => false);

          
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Invaild Email or Password'),
          backgroundColor: Colors.red));
      debugPrint("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text("Turf Sports"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
          // backgroundColor: const Color.fromARGB(255, 103, 134, 75),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              debugPrint("button clicked");
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 210,
                width: double.infinity,
                color: Colors.lightGreen[900],
                child: header(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      username(),
                      password(),
                      login(context),
                      forget(),
                      signup(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget header() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Welcome Back!!!!",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget username() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
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
              return "Invalid email";
            },
            decoration: InputDecoration(
              hintText: "Username",
              prefixIcon: const Icon(Icons.person),
              border: const OutlineInputBorder(),
              fillColor: Theme.of(context).primaryColorLight.withOpacity(0.1),
              filled: false,
            ),
          ),
        ),
      ],
    );
  }

  Widget password() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: TextFormField(
            controller: _passwordController,
            obscureText: true,
            validator: (passvalue) {
              if (passvalue!.isEmpty) {
                return "Please enter your Password";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: const Icon(Icons.lock),
              border: const OutlineInputBorder(),
              fillColor: Theme.of(context).primaryColorLight.withOpacity(0.1),
              filled: false,
            ),
          ),
        ),
      ],
    );
  }

  Widget login(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 90),
      child: MaterialButton(
        minWidth: double.infinity,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _login();
          }
        },
        color: Colors.lightGreen[900],
        textColor: Colors.white,
        child: const Text("Login"),
      ),
    );
  }

  Widget forget() {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextButton(
        onPressed: () {},
        child: const Text("Forget password"),
      ),
    );
  }

  Widget signup(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                         const SignnWidget()),
                );
              },
              color: Colors.lightGreen[900],
              textColor: Colors.white,
              child: const Text("Signup"),
            ),
          ),
        ],
      ),
    );
  }
}
