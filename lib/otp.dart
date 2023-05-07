import 'dart:io';

import 'package:codelibrary/colors.dart';
import 'package:codelibrary/homePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreen extends StatelessWidget {
  final String email;

  const OtpScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: "Code Library".text.xl2.bold.make(),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
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
                children: [
                  "Enter OTP".text.color(simpleWhite).xl4.bold.make(),
                  SizedBox(
                    height: 20,
                  ),
                  "Please Enter The OTP Send to"
                      .text
                      .color(simpleWhite)
                      .xl
                      .make(),
                  SizedBox(
                    height: 5,
                  ),
                  email.text.color(simpleWhite).xl.bold.make(),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10,),
                      OTPBOX(),
                      OTPBOX(),
                      OTPBOX(),
                      OTPBOX(),
                      SizedBox(height: 10,)
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(buttoncolor),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Navigate to the Home screen
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }
                      },
                      child: "Verify".text.xl2.white.bold.make(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
      backgroundColor: screenBgcolor,
    );
  }
}

class OTPBOX extends StatelessWidget {
  const OTPBOX({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "!";
          }
        },
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(fontSize: 15, color: simpleWhite),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
            filled: true,
            fillColor: inputBg,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: inputBorder)),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}


