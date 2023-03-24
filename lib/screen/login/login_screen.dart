import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signin_signup/screen/utiles/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    right: -20,
                    top: -130,
                    child: Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -30,
                    top: -130,
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -70,
                    top: -90,
                    child: Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 160,
                    top: 180,
                    child: Center(
                      child: Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white70),
                        child: Image.asset(
                          "assets/logo/flutter.png",
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 90),
            Container(
              height: 70,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.email,
                    color: Colors.blue,
                    size: 20,
                  ),
                  hintText: "Email",
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 70,
              width: 400,
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                    size: 20,
                  ),
                  hintText: "Password",
                ),

              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            InkWell(
              onTap: () async {
                var UserEmail = txtEmail.text;
                var UserPassword = txtPassword.text;
                print(UserEmail);
                print(UserPassword);

                Shr shr = Shr();
                Map m1 = await shr.readData();

                if (UserEmail == m1['g1'] && UserPassword == m1['p1']) {
                  Navigator.pushNamed(context, 'welcome');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Invalid PassWord Or Email"),
                    ),
                  );
                }
              },
              child: Container(
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.shade900,
                      Colors.blue,
                    ],
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'signup');
                },
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Create New Account?",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Colors.blue.shade900,
                        )),
                  ]),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}