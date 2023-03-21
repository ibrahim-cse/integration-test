import 'package:expansion_panal/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value) ? 'Enter a valid email address' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    key: const Key('email'),
                    controller: emailController,
                    validator: validateEmail,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 18),
                      hintText: 'Enter valid email id',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                  //padding: EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: passwordController,
                    key: Key('password'),
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 18),
                      hintText: 'Enter secure password',
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: ElevatedButton(
                    key: const Key('login'),
                    onPressed: () {
                      if (passwordController.text == '1234' || _formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => MyHomePage()));
                      } else {
                        print('Login failed...');
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Stack(
                                  overflow: Overflow.visible,
                                  children: <Widget>[
                                    Positioned(
                                        right: -18,
                                        top: -18,
                                        child: IconButton(
                                          highlightColor: Colors.redAccent,
                                          icon: const Icon(Icons.close, color: Colors.black26),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          width: 200.0,
                                          height: 60.0,
                                          child: const Icon(Icons.check, size: 40, color: Colors.green),
                                          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.green)),
                                        ),
                                        const SizedBox(height: 20.0),
                                        const Center(
                                          child: Text(
                                            "Login failed... \n\nPlease enter valid email and password",
                                            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // insetPadding: const EdgeInsets.symmetric(horizontal: 150, vertical: 120),
                                actions: [
                                  TextButton(
                                    child: const Text(
                                      'Close',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context); // Go back to previous page
                                    },
                                  ),
                                  const SizedBox(width: 5.0),
                                ],
                              );
                            });
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
      ),
    );
  }
}
