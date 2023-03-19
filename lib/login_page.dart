import 'package:expansion_panal/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  key: const Key('email'),
                  controller: emailController,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(), labelText: 'Email', labelStyle: TextStyle(fontSize: 18), hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: passwordController,
                  key: Key('password'),
                  obscureText: true,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Password', labelStyle: TextStyle(fontSize: 18), hintText: 'Enter secure password'),
                ),
              ),
              // FlatButton(
              //   onPressed: (){
              //     //TODO FORGOT PASSWORD SCREEN GOES HERE
              //   },
              //   child: Text(
              //     'Forgot Password',
              //     style: TextStyle(color: Colors.blue, fontSize: 15),
              //   ),
              // ),
              const SizedBox(height: 15),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                child: ElevatedButton(
                  key: const Key('login'),
                  onPressed: () {
                    if (passwordController.text == '1234') {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
                    } else {
                      print('Login failed...');
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
