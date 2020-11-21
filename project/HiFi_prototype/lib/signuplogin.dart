import 'package:flutter/material.dart';

class SignupTutor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: null,
        body: Column(
          children: [
            SizedBox(height: 20),
            Image.asset('assets/images/signuptutor.png'),
            Text("Sign up as Tutor"),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Username'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Gender'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'College'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Choose Subjects'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/landingtutor');
                        },
                        child: Text("Sign up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignupTutee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: null,
        body: Column(
          children: [
            SizedBox(height: 20),
            Image.asset('assets/images/signuptutee.png'),
            Text("Sign up as Tutee"),
            Form(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Username'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Gender'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'College'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, '/landingtutee');
                        },
                        child: Text("Sign up"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    TextEditingController username = TextEditingController();

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: null,
        body: Column(
          children: [
            SizedBox(height: 20),
            Image.asset('assets/images/login.png'),
            Text("Login"),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: username,
                      decoration: InputDecoration(hintText: 'Username'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          if (username.text == "tutee") {
                            Navigator.pushReplacementNamed(
                              context, '/landingtutee');
                          } else if (username.text == "tutor") {
                            Navigator.pushReplacementNamed(
                              context, '/landingtutor');
                          }
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
