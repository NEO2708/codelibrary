
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:codelibrary/colors.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        // AppBar Title
        title: "Cart".text.xl3.color(simpleWhite).bold.make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        bottom: BorderSide(color: lightWhite))),
                width: 1100,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      "₹ 2,000"
                          .text
                          .color(simpleWhite)
                          .fontWeight(FontWeight.w500)
                          .xl3
                          .make(),

                      SizedBox(
                        width: 20,
                      ),
                      // Add to cart

                      TextButton.icon(
                          style: ButtonStyle(
                              // maximumSize: MaterialStateProperty.all(Size(2,50)),
                              fixedSize:
                                  MaterialStateProperty.all(Size(150, 50)),
                              backgroundColor:
                                  MaterialStatePropertyAll(simpleWhite),
                              side: MaterialStateProperty.all(
                                  BorderSide(color: cardBgcolor, width: 3)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          onPressed: () {},
                          icon: Icon(Icons.payment_outlined)
                              .iconColor(cardBgcolor),
                          label: "CheckOut"
                              .text
                              .white
                              .xl
                              .bold
                              .color(cardBgcolor)
                              .make()),
                    ],
                  ),
                ),
              ),
            )),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: screenWidth(context) > 1150 ? 600 : 800,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightWhite),
                        borderRadius: BorderRadius.circular(10),
                        color: cardBgcolor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Course Detail".text.xl4.bold.color(simpleWhite).make(),
                        Divider(
                          color: simpleWhite,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CartCard(
                            coursename: "Python ",
                            type: "Coding",
                            price: "₹ 1449"),
                        CartCard(
                            coursename: "Java ",
                            type: "Coding, Development",
                            price: "₹ 1999"),
                        CartCard(
                            coursename: "Flutter ",
                            type: "Coding, Testing, Analytic",
                            price: "₹ 1559"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
              SizedBox(
                width: screenWidth(context) > 1150 ? 20 : 0,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: screenWidth(context) > 1150 ? 500 : 800,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightWhite),
                        borderRadius: BorderRadius.circular(10),
                        color: cardBgcolor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Student Id: 3122 "
                            .text
                            .xl4
                            .bold
                            .color(simpleWhite)
                            .make(),
                        Divider(
                          color: simpleWhite,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        MyInfo(value: "The code Library"),
                        SizedBox(
                          height: 10,
                        ),
                        MyInfo(value: "codelibrary@gmail.com"),
                        SizedBox(
                          height: 10,
                        ),
                        MyInfo(value: "1234567890"),
                        SizedBox(
                          height: 10,
                        ),
                        MyInfo(value: "Andhra Pradesh"),
                        SizedBox(
                          height: 50,
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.discount_outlined)
                              .iconColor(simpleWhite)
                              .iconSize(30),
                          label:
                              "Apply Coupon".text.color(simpleWhite).xl2.make(),
                        ),
                        Divider(
                          color: simpleWhite,
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //  CheckOut
                        "CheckOut".text.xl3.color(simpleWhite).make(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            "₹ 2,000".text.color(Colors.amber).xl4.bold.make(),
                            Container(
                              width: 150,
                              height: 50,
                              child: TextButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.payment)
                                    .iconColor(screenBgcolor),
                                label: "Buy Now"
                                    .text
                                    .color(screenBgcolor)
                                    .xl3
                                    .make(),
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(simpleWhite),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    )),
                                
                              ),
                              
                            ),
                          ],
                        ),
                            SizedBox(height: 50,),
                            "Code Library".text.color(Color.fromARGB(156, 226, 226, 226)).xl6.make()

                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      )),
      backgroundColor: screenBgcolor,
    );
  }
}

class CartCard extends StatelessWidget {
  final String coursename;
  final String type;
  final String price;
  const CartCard({
    Key? key,
    required this.coursename,
    required this.type,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        coursename.text.xl3.color(simpleWhite).make(),
        type.text.xl.color(lightWhite).make(),
        SizedBox(
          height: 5,
        ),
        price.text.color(simpleWhite).xl3.bold.make(),
        Divider(
          color: simpleWhite,
          thickness: 1,
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
// Reusing 
class MyInfo extends StatelessWidget {
  final String value;
  const MyInfo({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        initialValue: value,
        style: TextStyle(color: simpleWhite, fontSize: 20),
        decoration: InputDecoration(
          suffixIcon:
              Icon(Icons.done_outline_rounded).iconColor(Colors.greenAccent),
        ));
  }
}
