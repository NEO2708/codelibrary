// ignore_for_file: sized_box_for_whitespace, unused_local_variable

import 'package:codelibrary/Signup.dart';
import 'package:codelibrary/colors.dart';
import 'package:codelibrary/otp.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Code Library".text.xl2.bold.make(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: screenBgcolor,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 600,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    "Welcome".text.color(simpleWhite).xl4.make(),
                    const SizedBox(
                      height: 30,
                    ),
                    "Log In".text.white.bold.letterSpacing(2).xl5.make(),
                    const SizedBox(
                      height: 30,
                    ),
                    const InputInfo(
                        icon: Icons.email,
                        infoText: "Enter Your Registered Email"),
                    const SizedBox(
                      height: 30,
                    ),
                    InputBox(
                        Controller: _emailController,
                        Inputype: TextInputType.emailAddress,
                        Validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                        hintText: "Email"),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(buttoncolor),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            String emailController = _emailController.text;
                            // Navigate to the OTP screen
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => OtpScreen(
                                        email: _emailController.text)));
                          }
                        },
                        child: "Log In".text.xl2.white.bold.make(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Don't have Account? ".text.color(simpleWhite).make(),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupScreen()));
                            },
                            child: "Sign UP".text.bold.xl2.make()),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                    
                              "or".text.color(simpleWhite).xl.make(),
                              SizedBox(height: 20,),
                              Container(
                                width: 300,
                                padding: EdgeInsets.all(20),
                               
                                decoration: BoxDecoration(
                                   color:cardBgcolor,
                                   borderRadius: BorderRadius.circular(30),
                                   border: Border.all(color: simpleWhite,width: 2)
                                ),
                                
                                child: ElevatedButton(
                                  
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(cardBgcolor),
                                    elevation: MaterialStateProperty.all(0)
                                    
                                    
                                  ),
                                  onPressed: () {
                                  
                                },child: Row(children: [
                                  Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/588px-Google_%22G%22_Logo.svg.png").w(20),
                                  SizedBox(width: 20,),
                                  "LogIn with Google".text.xl2.color(simpleWhite).make()
                                ]),),
                              )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
