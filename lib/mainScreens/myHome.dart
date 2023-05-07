import 'package:codelibrary/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';



class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
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
                  height: 160,
                  color: screenBgcolor,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "CodeLibrary".text.color(simpleWhite).xl2.bold.make(),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.notifications)
                                    .iconColor(simpleWhite))
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
                          Container(
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
                  children: [
                    RegisteredRow(),
                    AvailabledRow(),
                  ],
                )),
          )),
      backgroundColor: screenBgcolor,
    );
  }
}
// Card used in all 
class CourseCard extends StatelessWidget {
  const CourseCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth <= 610 ? screenWidth - 50 : 500,
      child: Card(
        color: cardBgcolor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Course Name".text.color(simpleWhite).xl.make(),
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
                      "₹ 1449".text.color(simpleWhite).bold.xl3.make()
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
    );
    ;
  }
}

// Registered course row
class RegisteredRow extends StatelessWidget {
   RegisteredRow({super.key});

  final _scrollController = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

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
      screenWidth >= 610
          ? Center(
              child: Container(
                width: 1610,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _scrollLeft,
                      icon: Icon(Icons.arrow_left)
                          .iconColor(simpleWhite)
                          .iconSize(40),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              CourseCard(),
                              CourseCard(),
                              CourseCard(),
                              CourseCard(),
                              CourseCard(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: _scrollRight,
                      icon: Icon(Icons.arrow_right)
                          .iconColor(simpleWhite)
                          .iconSize(40),
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CourseCard(),
                  CourseCard(),
                  CourseCard(),
                  CourseCard(),
                  CourseCard(),
                ],
              ),
            ),
    ]);
  }
}

// Aailable course row
class AvailabledRow extends StatelessWidget {
   AvailabledRow({super.key});

  final _scrollController = ScrollController();

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
      screenWidth >= 610
          ? Center(
              child: Container(
                width: 1610,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _scrollLeft,
                      icon: Icon(Icons.arrow_left)
                          .iconColor(simpleWhite)
                          .iconSize(40),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              CourseCard(),
                              CourseCard(),
                              CourseCard(),
                              CourseCard(),
                              CourseCard(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    IconButton(
                      onPressed: _scrollRight,
                      icon: Icon(Icons.arrow_right)
                          .iconColor(simpleWhite)
                          .iconSize(40),
                    ),
                  ],
                ),
              ),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CourseCard(),
                  CourseCard(),
                  CourseCard(),
                  CourseCard(),
                  CourseCard(),
                ],
              ),
            ),
    ]);
  }
}