import 'package:codelibrary/mainScreens/cart.dart';
import 'package:codelibrary/mainScreens/myHome.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:codelibrary/colors.dart';

class CourseContent extends StatefulWidget {
  const CourseContent({super.key});

  @override
  State<CourseContent> createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        bottom: BorderSide(color: lightWhite))),
                width: 1500,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      screenWidth(context) > 425
                          ? "₹ 1449"
                              .text
                              .color(simpleWhite)
                              .fontWeight(FontWeight.w500)
                              .xl3
                              .make()
                          : Text(""),
                      SizedBox(
                        width: 20,
                      ),
                      // Add to cart
Spacer(),
                      TextButton.icon(
                          style: ButtonStyle(
                              // maximumSize: MaterialStateProperty.all(Size(2,50)),
                              fixedSize:
                                  MaterialStateProperty.all(Size(150, 50)),
                              backgroundColor:
                                  MaterialStatePropertyAll(cardBgcolor),
                              side: MaterialStateProperty.all(
                                  BorderSide(color: simpleWhite, width: 3)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          onPressed: () {},
                          icon: Icon(Icons.add).iconColor(simpleWhite),
                          label: "Add To Cart"
                              .text
                              .white
                              .xl
                              .bold
                              .color(simpleWhite)
                              .make()),
                      TextButton.icon(
                          style: ButtonStyle(
                              // maximumSize: MaterialStateProperty.all(Size(2,50)),
                              fixedSize:
                                  MaterialStateProperty.all(Size(150, 50)),
                              backgroundColor:
                                  MaterialStatePropertyAll(simpleWhite),
                              side: MaterialStateProperty.all(
                                  BorderSide(color: inputBg, width: 3)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                          onPressed: () {},
                          icon: Icon(Icons.money).iconColor(inputBg),
                          label:
                              "Buy".text.white.xl.bold.color(inputBg).make()),
                    ],
                  ),
                ),
              ),
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.trolley).iconSize(35),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyCart(),
                  ));
                },
              )),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(Icons.favorite_border).iconSize(35),
                onPressed: () {},
              ))
        ],
      ),
      body:
      
      context.screenWidth >=860 ?
       SingleChildScrollView(
        child: Container(
          width: screenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // width: 800,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child:
                  // context.screenWidth >600? 
                  
                   Wrap(children: [
                   
                    Container(
                      width: screenWidth(context) /2,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: cardBgcolor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(children: [
                         
                        "Syllabus "
                            .text
                            .xl4
                            .color(simpleWhite)
                            .underline
                            .align(TextAlign.center)
                            .make(),
                        SizedBox(
                          height: 20,
                        ),
                        SyllabusCard()
                        
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                      width: screenWidth(context) >1050? 10:30 ,
                    ),
                    // Container(width: 10,height: 10,),
                    // course name
                    Container(
                      width: 370,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: cardBgcolor,
                          borderRadius: BorderRadius.circular(30)),
                      child: 
                    CourseInfo()
                    ),
                    
                  ])
                ),
              )
            ],
          ),
        ),
      ):SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: screenWidth(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               
                      Container(
                        width: 500,
                        padding: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            color: cardBgcolor,
                            borderRadius: BorderRadius.circular(30)),
                        child: 
                      CourseInfo()
                      ),
                      SizedBox(
                        height: 20,
                        width: screenWidth(context) >1050? 10:30 ,
                      ),
                      // Container(width: 10,height: 10,),
                      // course name
                       Container(
                  // width: 800,
                  child: Wrap(children: [
                  
                   Container(
                     width: 500,
                     padding: EdgeInsets.all(30),
                     decoration: BoxDecoration(
                         color: cardBgcolor,
                         borderRadius: BorderRadius.circular(30)),
                     child: Column(children: [
                        
                       "Syllabus "
                           .text
                           .xl4
                           .color(simpleWhite)
                           .underline
                           .align(TextAlign.center)
                           .make(),
                       SizedBox(
                         height: 20,
                       ),
                       SyllabusCard()
                       
                     ]),
                   ),
                   
                    ]),
                )
              ],
            ),
          ),
        ),
      ),
      backgroundColor: screenBgcolor,
    );
  }
}

class Item {
  String headerValue;
  List<String> expandedValue;
  bool isExpanded;

  Item(
      {required this.headerValue,
      required this.expandedValue,
      this.isExpanded = false});
}

class SyllabusCard extends StatefulWidget {
  const SyllabusCard({super.key});

  @override
  State<SyllabusCard> createState() => _SyllabusCardState();
}

class _SyllabusCardState extends State<SyllabusCard> {
  final List<Item> _items = [
    Item(
      headerValue: 'Introduction Video',
      expandedValue: [
        'Demo Video',
      ],
      isExpanded: false,
    ),
    Item(
      headerValue: 'Python Basics',
      expandedValue: [
        '1. Introduction to python',
        '2. Introduction to python',
      ],
      isExpanded: false,
    ),
    Item(
      headerValue: 'Python Basics',
      expandedValue: [
        '1. Introduction to python',
        '2. Introduction to python',
      ],
      isExpanded: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
                          child: ExpansionPanelList(
                            expansionCallback: (int index, bool isExpanded) {
                              setState(() {
                                _items[index].isExpanded = !isExpanded;
                              });
                            },
                            children: _items.map<ExpansionPanel>((Item item) {
                              return ExpansionPanel(
                                canTapOnHeader: true,
                                backgroundColor: simpleWhite,
                                headerBuilder:
                                    (BuildContext context, bool isExpanded) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ListTile(
                                        tileColor: inputBg,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        title: item.headerValue.text
                                            .color(Colors.black)
                                            .bold
                                            .xl2
                                            .make(),
                                      ).backgroundColor(simpleWhite),
                                      
                                    ],
                                  );
                                },
                                body: Column(
                                  children: item.expandedValue
                                      .map((value) => ListTile(
                                            leading: Icon(Icons.play_arrow)
                                                .iconColor(Colors.black)
                                                .iconSize(30),
                                            onTap: () {
                                              // Show video
                                            },
                                            title: value.text.bold.xl.make(),
                                          ))
                                      .toList(),
                                ),
                                isExpanded: item.isExpanded,
                              );
                            }).toList(),
                          ),
                        );
  }
}

class CourseInfo extends StatelessWidget {
  const CourseInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                      width: screenWidth(context) >1050? 350:800,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                          color: cardBgcolor,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Python Data Science with numpy, Pandas, Metplotlib"
                              .text
                              .color(simpleWhite)
                              .fontWeight(FontWeight.w500)
                              .headline4(context)
                              .make(),
                          SizedBox(
                            height: 20,
                          ),
                          // Price
                          "₹ 1449"
                              .text
                              .color(simpleWhite)
                              .fontWeight(FontWeight.w500)
                              .headline4(context)
                              .make(),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton.icon(
                          style: ButtonStyle(
                              // maximumSize: MaterialStateProperty.all(Size(2,50)),
                              fixedSize:
                                  MaterialStateProperty.all(Size(250, 50)),
                              backgroundColor:
                                  MaterialStatePropertyAll(cardBgcolor),
                              side: MaterialStateProperty.all(
                                  BorderSide(color: simpleWhite, width: 3)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(50)))),
                              onPressed: () {},
                              icon: Icon(Icons.play_arrow_outlined)
                                  .iconColor(simpleWhite)
                                  .iconSize(30),
                              label: "Preview Course"
                                  .text
                                  .xl2
                                  .bold
                                  .color(simpleWhite)
                                  .make()),
                          SizedBox(
                            height: 20,
                          ),
                          Wrap(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.bar_chart)
                                      .iconSize(30)
                                      .iconColor(simpleWhite),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  "Level             : All"
                                      .text
                                      .color(simpleWhite)
                                      .xl2
                                      .bold
                                      .make(),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.alarm_add_outlined)
                                      .iconSize(30)
                                      .iconColor(simpleWhite),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  "Duration      : 15 Hr"
                                      .text
                                      .color(simpleWhite)
                                      .xl2
                                      .bold
                                      .make(),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.person)
                                      .iconSize(30)
                                      .iconColor(simpleWhite),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  "Lessons        :108"
                                      .text
                                      .color(simpleWhite)
                                      .xl2
                                      .bold
                                      .make(),
                                ],
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.abc)
                                      .iconSize(30)
                                      .iconColor(simpleWhite),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  "Languages  : English"
                                      .text
                                      .color(simpleWhite)
                                      .xl2
                                      .bold
                                      .make(),
                                ],
                                
                              ),
                              
                            ],
                          ),
                            
                        ],
                      ),
                    );
  }
}