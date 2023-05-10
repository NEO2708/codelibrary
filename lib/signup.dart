// ignore_for_file: file_names, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:codelibrary/colors.dart';
import 'package:codelibrary/login.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Code Library".text.xl2.bold.make(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SizedBox(
          width: 600,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    "SignUp".text.white.bold.letterSpacing(2).xl5.make(),
                    SizedBox(
                      height: 50,
                    ),
                    // Name Input
                    InputInfo(icon: Icons.person, infoText: "Name"),
                    SizedBox(
                      height: 10,
                    ),
                    InputBox(
                        Controller: _nameController,
                        Inputype: TextInputType.name,
                        Validation: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Name';
                          }

                          return null;
                        },
                        hintText: "Name"),
                    SizedBox(height: 16.0),
                    // Email Input
                    InputInfo(icon: Icons.mail, infoText: "Email"),
                    SizedBox(
                      height: 10,
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
                    SizedBox(height: 16.0),
                    // Password
                    InputInfo(icon: Icons.lock, infoText: "Password"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        return null;
                      },
                      style: TextStyle(color: simpleWhite),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: simpleWhite),
                        filled: true,
                        fillColor: inputBg,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: inputBorder),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        hintText: '********',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ).iconColor(simpleWhite),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Confirm Password
                    InputInfo(icon: Icons.lock, infoText: "Confirm Password"),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _confirmPasswordController,
                      obscureText: !_isConfirmPasswordVisible,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please confirm your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      style: TextStyle(color: simpleWhite),
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: simpleWhite),
                        filled: true,
                        fillColor: inputBg,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(color: inputBorder),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: '********',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isConfirmPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ).iconColor(simpleWhite),
                          onPressed: () {
                            setState(() {
                              _isConfirmPasswordVisible =
                                  !_isConfirmPasswordVisible;
                            });
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 32.0),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(buttoncolor ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Create a new account and navigate to login
                          
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                      
                          }
                        },
                        child: "Sign Up".text.xl2.white.bold.make(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Already have Account? ".text.color(simpleWhite).make(),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()));
                            },
                            child: "Log In".text.bold.xl2.make())
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: screenBgcolor,
    );
  }
}

class InputInfo extends StatelessWidget {
  final icon;
  final String infoText;

  const InputInfo({
    Key? key,
    required this.icon,
    required this.infoText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon).iconSize(30).iconColor(simpleWhite),
        SizedBox(
          width: 10,
        ),
        infoText.text.color(simpleWhite).xl2.make(),
      ],
    );
  }
}

class InputBox extends StatelessWidget {
  final Controller;
  final Inputype;
  final Validation;
  final hintText;
  const InputBox(
      {super.key,
      required this.Controller,
      required this.Inputype,
      required this.Validation,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: Controller,
      keyboardType: Inputype,
      validator: Validation,
      style: TextStyle(color: simpleWhite),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: simpleWhite),
        filled: true,
        fillColor: inputBg,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: inputBorder),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
