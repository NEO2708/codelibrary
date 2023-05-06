// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignupScreen(),
    );
  }
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              "SignUp".text.white.bold.letterSpacing(2).xl5.make(),
              SizedBox(
                height: 50,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  prefixIconColor: Colors.white,
                  labelText: "Enter Your Email",
                  labelStyle: TextStyle(color: Colors.white),

                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 225, 225, 225))),
                  // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white)),

                  hintText: "Name",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 179, 179, 179)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                style: TextStyle(color: Colors.white),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  prefixIconColor: Colors.white,
                  labelText: "Enter Your Email",
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 225, 225, 225))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Email",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 179, 179, 179)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Password
              TextFormField(
                obscureText: show ? false : true,
                style: TextStyle(color: Colors.white),
                // keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  prefixIconColor: Colors.white,
                  labelText: "Enter Your Password",
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          if (show == true) {
                            show = false;
                          } else {
                            show = true;
                          }
                        });
                      },
                      child: show
                          ? Icon(Icons.hide_source)
                          : Icon(Icons.remove_red_eye_outlined)),
                  suffixIconColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 173, 173, 173)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 146, 250))),
                  hintText: "Password",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 179, 179, 179)),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: Center(child: "Sign Up".text.xl2.bold.make())),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 72, 100, 237)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "or".text.white.make(),
                ],
              )
              // Signin With google
              // Signin with apple
              // Already have Acoount
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 12, 22, 49),
      ),
    );
  }
}
class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                height: 50,
              ),
              "SignUp".text.white.bold.letterSpacing(2).xl5.make(),
              SizedBox(
                height: 50,
              ),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email address';
                    }
                    if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'example@example.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
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
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: '********',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
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
                  decoration: InputDecoration(
                    hintStyle:
                      TextStyle(color: Color.fromARGB(255, 179, 179, 179)),
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),

                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 173, 173, 173)),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 0, 146, 250))),
                    labelText: 'Confirm password',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: '********',
                    border: OutlineInputBorder(
                      
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isConfirmPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
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
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 72, 100, 237)),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Do something here, like create a new account
                      }
                    },
                    child: "Sign Up".text.xl2.white.bold.make(),
                  ),
                ),
              ],
            ),
          ),
        ),
          backgroundColor: Color.fromARGB(255, 12, 22, 49),
    
      ),
    );
  }
}