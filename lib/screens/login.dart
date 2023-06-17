import 'package:flutter/material.dart';
import 'package:flutter_auth/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;

  _loginWithFacebook() {
    setState(() {
      _isLoading = true;
    });
    AuthService()
        .loginWithFacebook()
        .then((value) => {
              setState(() {
                _isLoading = false;
              })
            })
        .catchError((e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error login into facebook!')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('images/lock.png'),
            const SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                width: double.infinity,
                height: 45.0,
                child: TextButton(
                  onPressed: _isLoading
                      ? null
                      : () {
                          _loginWithFacebook();
                        },
                  child: Text(
                    'Login with Facebook',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xff3b5998)),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 15.0),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
