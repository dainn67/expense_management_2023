import 'package:flutter/material.dart';

class SignupBody extends StatefulWidget {
  final Function() updateCallback;

  const SignupBody({super.key, required this.updateCallback});

  @override
  _SignupBodyState createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cfPasswordController = TextEditingController();

  final FocusNode usernameNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode cfPasswordNode = FocusNode();

  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;


    if (username == 'a' && password == '1') {
      // Successful login, navigate to the home screen.
      // Navigator.of(context).pushReplacement(
      // MaterialPageRoute(builder: (context) => const HomeScreen()),
      // );
    } else {
      // Invalid credentials, show an error message.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Invalid username or password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:const EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: const Center(
                      child: Text("SIGN IN",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue)))),
            ),
            TextField(
              focusNode: usernameNode,
              controller: _usernameController,
              onSubmitted: (_) {
                usernameNode.unfocus();
                FocusScope.of(context).requestFocus(passwordNode);
              },
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  prefixIcon: const Icon(Icons.person_outline)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            TextField(
              focusNode: passwordNode,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                prefixIcon: const Icon(Icons.lock_outline),
              ),
              obscureText: true,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            TextField(
              focusNode: passwordNode,
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Confirm password',
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                prefixIcon: const Icon(Icons.lock_outline),
              ),
              obscureText: true,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            ElevatedButton(
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))),
              onPressed: _login,
              child: const Padding(padding: EdgeInsets.all(10.0), child: Text('Sign up', style: TextStyle(fontSize: 18),)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have account? "),
                GestureDetector(
                  onTap: (){widget.updateCallback();},
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}