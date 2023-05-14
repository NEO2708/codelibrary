// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'dart:convert';
import 'package:codelibrary/mainScreens/courseDetail.dart';
import 'package:codelibrary/mainScreens/data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:codelibrary/colors.dart';
import 'package:codelibrary/login.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: true,
                pinned: true,
                flexibleSpace: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: kIsWeb ? 70 : 160,
                  color: screenBgcolor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "CodeLibrary".text.color(simpleWhite).xl2.bold.make(),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.trolley)
                                    .iconColor(simpleWhite)
                                    .iconSize(30)),
                            PopupMenuButton(
                                icon: Icon(Icons.person)
                                    .iconSize(30)
                                    .iconColor(simpleWhite),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                          child: Container(
                                        width: 290,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: BorderDirectional(
                                                          bottom: BorderSide(
                                                              color: lightWhite,
                                                              width: 2))),
                                                  padding: EdgeInsetsDirectional
                                                      .only(bottom: 2),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundImage:
                                                            NetworkImage(
                                                                "https://www.pngmart.com/files/22/User-Avatar-Profile-PNG.png"),
                                                        radius: 25,
                                                        backgroundColor:
                                                            screenBgcolor,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // UserName
                                                          SizedBox(
                                                            height: 10,
                                                          ),

                                                          "Code Library"
                                                              .text
                                                              .xl2
                                                              .bold
                                                              .make(),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          // User Email
                                                          "codelibrary@gmail.com"
                                                              .text
                                                              .xl
                                                              .wrapWords(true)
                                                              .make(),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 4,
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyCourse(),
                                                  ));
                                                },
                                                child: "My Course"
                                                    .text
                                                    .xl2
                                                    .bold
                                                    .color(screenBgcolor)
                                                    .make()),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen(),
                                                  ));
                                                },
                                                child: "Log Out"
                                                    .text
                                                    .xl2
                                                    .bold
                                                    .make()),
                                          ],
                                        ),
                                      ))
                                    ])
                          ],
                        )
                      ]),
                ),
                bottom: PreferredSize(
                  preferredSize: Size(300, 80),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    color: screenBgcolor,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Search bar
                          SizedBox(
                              width: MediaQuery.of(context).size.width - 20,
                              child: TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: inputBg,
                                    hintText: "Search a course",
                                    hintStyle: TextStyle(color: simpleWhite),
                                    suffix: InkWell(
                                        onTap: () {
                                          // Show categories
                                        },
                                        child: Text("|  Categories")),
                                    suffixStyle: TextStyle(color: simpleWhite),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        borderSide:
                                            BorderSide(color: simpleWhite)),
                                    prefixIcon: Icon(Icons.search)
                                        .iconColor(simpleWhite)),
                              ))
                        ]),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [screenWidth >= 600 ? Desktop() : Mobile()],
                )),
          )),
      backgroundColor: screenBgcolor,
    );
  }
}
class Mobile extends StatefulWidget {
  const Mobile({super.key});

  @override
  State<Mobile> createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var data = await rootBundle.loadString("assets/data.json");
    var decodedData = jsonDecode(data);
    var courseData = decodedData["availableCourses"];
    // print(courseData);
    Datamodel.Courses = List.from(courseData)
        .map<Data>((course) => Data.fromMap(course))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
        ),
        "Registered Course"
            .text
            .uppercase
            .underline
            .xl2
            .wordSpacing(2)
            .letterSpacing(2)
            .color(simpleWhite)
            .make(),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 280,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Datamodel.Courses.length,
              itemBuilder: (context, index) {
                return GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseContent(title: Datamodel.Courses[index].title, price: Datamodel.Courses[index].price,) )),

                  child: MobileCourseCard(
                    name: Datamodel.Courses[index].title,
                    price: Datamodel.Courses[index].price,
                  ),
                );
              }),
        ),
        SizedBox(
          height: 30,
        ),
        "Available Course"
            .text
            .uppercase
            .underline
            .xl2
            .wordSpacing(2)
            .letterSpacing(2)
            .color(simpleWhite)
            .make(),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 280,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Datamodel.Courses.length,
              itemBuilder: (context, index) {
                return GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseContent(title: Datamodel.Courses[index].title, price: Datamodel.Courses[index].price,) )),

                  child: MobileCourseCard(
                    name: Datamodel.Courses[index].title,
                    price: Datamodel.Courses[index].price,
                  ),
                );
              }),
        ),
      ],
    );
  }
}

class Desktop extends StatefulWidget {
  Desktop({super.key});

  @override
  State<Desktop> createState() => _DesktopState();
}

class _DesktopState extends State<Desktop> {
  final _scrollController = ScrollController();
  final _scrollController2 = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 500,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 500,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
  void _scrollLeft2() {
    _scrollController2.animateTo(
      _scrollController2.offset - 500,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void _scrollRight2() {
    _scrollController2.animateTo(
      _scrollController2.offset + 500,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    var data = await rootBundle.loadString("assets/data.json");
    var decodedData = jsonDecode(data);
    var courseData = decodedData["availableCourses"];
    // print(courseData);
    Datamodel.Courses = List.from(courseData)
        .map<Data>((course) => Data.fromMap(course))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 30,
      ),
      "Registered Course"
          .text
          .uppercase
          .underline
          .xl2
          .wordSpacing(2)
          .letterSpacing(2)
          .color(simpleWhite)
          .make(),
      SizedBox(
        height: 10,
      ),
      Center(
        child: Container(
          width: 1610,
          child: Row(
            children: [
              IconButton(
                onPressed: _scrollLeft,
                icon:
                    Icon(Icons.arrow_left).iconColor(simpleWhite).iconSize(40),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 280,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
                      itemCount: Datamodel.Courses.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseContent(title: Datamodel.Courses[index].title, price: Datamodel.Courses[index].price,) )),

                          child: MobileCourseCard(
                            name: Datamodel.Courses[index].title,
                            price: Datamodel.Courses[index].price,
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(width: 16),
              IconButton(
                onPressed: _scrollRight,
                icon:
                    Icon(Icons.arrow_right).iconColor(simpleWhite).iconSize(40),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 30,
      ),
      "Available Course"
          .text
          .uppercase
          .underline
          .xl2
          .wordSpacing(2)
          .letterSpacing(2)
          .color(simpleWhite)
          .make(),
      SizedBox(
        height: 10,
      ),
      Center(
        child: Container(
          width: 1610,
          child: Row(
            children: [
              IconButton(
                onPressed: _scrollLeft2,
                icon:
                    Icon(Icons.arrow_left).iconColor(simpleWhite).iconSize(40),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Container(
                  height: 280,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController2,
                      itemCount: Datamodel.Courses.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>CourseContent(title: Datamodel.Courses[index].title, price: Datamodel.Courses[index].price,) )),

                          child: MobileCourseCard(
                            name: Datamodel.Courses[index].title,
                            price: Datamodel.Courses[index].price,
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(width: 16),
              IconButton(
                onPressed: _scrollRight2,
                icon:
                    Icon(Icons.arrow_right).iconColor(simpleWhite).iconSize(40),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}




// 

class OwnCourses extends StatelessWidget {
  final Widget pageRoute;
  final String CourseName;
  final String CoursePrice;
  final String progress;
  const OwnCourses({
    Key? key,
    required this.CourseName,
    required this.CoursePrice,
    required this.progress,
    required this.pageRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 800,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: cardBgcolor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CourseName.text.color(simpleWhite).xl3.bold.make(),
        SizedBox(
          height: 10,
        ),
        "₹ ${CoursePrice}".text.color(simpleWhite).xl3.make(),
        SizedBox(
          height: 10,
        ),
        "Progress :- ${progress}%".text.xl.color(Colors.greenAccent).make(),
        SizedBox(
          height: 10,
        ),
        TextButton.icon(
            style: ButtonStyle(
                // maximumSize: MaterialStateProperty.all(Size(2,50)),
                fixedSize: MaterialStateProperty.all(Size(150, 50)),
                backgroundColor: MaterialStatePropertyAll(cardBgcolor),
                side: MaterialStateProperty.all(
                    BorderSide(color: simpleWhite, width: 3)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)))),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => pageRoute));
            },
            icon: Icon(Icons.open_in_new).iconColor(simpleWhite),
            label: "Open".text.white.xl.bold.color(simpleWhite).make()),
      ]),
    );
  }
}


class PythonForBegginers extends StatelessWidget {
  const PythonForBegginers({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Courses".text.xl2.bold.color(simpleWhite).make(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Container(
                  padding: EdgeInsets.all(15),
                  width: 800,
                  child: Column(
                    children: const [
                      OwnCourses(
                        CourseName: "Python for Beggineers, Data analytics",
                        CoursePrice: "1550",
                        progress: "50",
                        pageRoute: PythonForBegginers(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OwnCourses(
                        CourseName: "Python for Beggineers, Data analytics",
                        CoursePrice: "1550",
                        progress: "50",
                        pageRoute: PythonForBegginers(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OwnCourses(
                        CourseName: "Python for Beggineers, Data analytics",
                        CoursePrice: "1550",
                        progress: "50",
                        pageRoute: PythonForBegginers(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      OwnCourses(
                        CourseName: "Python for Beggineers, Data analytics",
                        CoursePrice: "1550",
                        progress: "50",
                        pageRoute: PythonForBegginers(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )))),
      backgroundColor: screenBgcolor,
    );
  }
}


class MobileCourseCard extends StatelessWidget {
  final String name;
  final String price;
  const MobileCourseCard({
    Key? key,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      width: screenWidth <= 610 ? screenWidth - 50 : 500,
    height: 280,
      child: InkWell(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          clipBehavior: Clip.antiAlias,
          color: cardBgcolor,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name.text.color(simpleWhite).xl3.bold.color(simpleWhite).maxLines(1).overflow(TextOverflow.ellipsis).make(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star).iconColor(simpleWhite),
                        Icon(Icons.star).iconColor(simpleWhite),
                        Icon(Icons.star).iconColor(simpleWhite),
                        Icon(Icons.star).iconColor(simpleWhite),
                        Icon(Icons.star_outline).iconColor(simpleWhite),
                      ],
                    ),
                    Wrap(
                      children: [
                        "₹ ${price}".text.color(simpleWhite).bold.xl3.make()
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                // Languages
                Row(
                  children: [
                    Icon(Icons.type_specimen).iconColor(simpleWhite),
                    SizedBox(
                      width: 10,
                    ),
                    "Languages : ".text.color(simpleWhite).xl.make(),
                    "English".text.xl.color(simpleWhite).bold.make()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
      
                Row(
                  children: [
                    Icon(Icons.bar_chart).iconColor(simpleWhite),
                    SizedBox(
                      width: 10,
                    ),
                    "Type : ".text.color(simpleWhite).xl.make(),
                    "Beginner".text.xl.color(beginner).bold.make()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 2,
                  color: lightWhite,
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: [
                    Wrap(
                      children: [
                        Container(
                          width: 150,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 2, color: simpleWhite),
                              color: Colors.transparent),
                          child: Row(children: [
                            Icon(Icons.play_arrow).iconColor(simpleWhite),
                            SizedBox(
                              width: 10,
                            ),
                            "Intro Video"
                                .text
                                .color(simpleWhite)
                                .wrapWords(true)
                                .uppercase
                                .make()
                          ]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 110,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(width: 2, color: simpleWhite),
                              color: Colors.transparent),
                          child: Row(children: [
                            Icon(Icons.add).iconColor(simpleWhite),
                            SizedBox(
                              width: 5,
                            ),
                            "Details".text.color(simpleWhite).uppercase.make()
                          ]),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite).iconColor(Colors.white),
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
