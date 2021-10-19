import 'package:airbnb_clone/data/data.dart';
import 'package:airbnb_clone/screens/request_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class RoomDetail extends StatefulWidget {
  @override
  _RoomDetailState createState() => _RoomDetailState();
}

class _RoomDetailState extends State<RoomDetail> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('₹ 2000/ night'),
                  SizedBox(height: 10),
                  Text(
                    '19 NOV - 21 NOV',
                    style: TextStyle(
                        color: KTealColor,
                        decoration: TextDecoration.underline,
                        fontSize: 10),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RequestPage()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: KThemeColor,
                  ),
                  height: 30,
                  width: 80,
                  child: Center(
                    child: Text(
                      "Reserve",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.2,
                          fontSize: 10),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        backwardsCompatibility: true,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back, color: KTealColor, size: 16)),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.upload_sharp, color: KTealColor, size: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.favorite, color: KTealColor, size: 16),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    //autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    height: 200.0,
                    viewportFraction: 1,
                  ),
                  itemCount: listPaths.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Stack(
                    children: [
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage('${listPaths[itemIndex]}'))),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 10,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listPaths.map((url) {
                        int index = listPaths.indexOf(url);
                        return Container(
                          width: _currentIndex == index ? 8 : 6,
                          height: _currentIndex == index ? 7 : 5,
                          margin: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.white
                                : Color(0xffC8C8C8),
                          ),
                        );
                      }).toList()),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.black)),
                    height: 40,
                    width: 80,
                    child: Center(
                      child: Text(
                        "Show all",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, letterSpacing: 0.2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: [
                    Divider(color: Colors.grey),
                    Text("Where you'll sleep"),
                    Container(height: 40, width: 40)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(color: Colors.grey),
                    Text('What this place offers'),
                    Text('Lorem ipsum'),
                    Text('Lorem ipsum'),
                    Text('Lorem ipsum'),
                    Text('Lorem ipsum'),
                    Text('Lorem ipsum'),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black)),
                      height: 40,
                      width: 80,
                      child: Center(
                        child: Text(
                          "Show all",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, letterSpacing: 0.2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(color: Colors.grey),
                    Text('Accessibility'),
                    Text('Lorem ipsum'),
                    Row(
                      children: [
                        Text('Lorem ipsum dolor sit amet.'),
                        Container(
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text('Lorem ipsum dolor sit amet.'),
                        Container(
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black)),
                      height: 40,
                      width: 80,
                      child: Center(
                        child: Text(
                          "Show all",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, letterSpacing: 0.2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Divider(color: Colors.grey),
                    Text("Where you'll be"),
                    Container(
                      height: 80,
                      width: 100,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                    ),
                    Text('Mumbai , Maharasthra'),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod '
                        'tempor invidunt ut labore et dolore magna aliquyam erat, sed diam.'),
                    Text('Lorem ipsum')
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(color: Colors.grey),
                    Text('★ 4.89  \u2022  257 reviews'),
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey)),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text('Hosted By Calvin'),
                                  subtitle: Text('joined 2 mon ago'),
                                  trailing: CircleAvatar(
                                    backgroundImage: AssetImage(
                                        'assets/images/profile-placeholder.jpg'),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text:
                                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor '
                                            'invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam '
                                            'et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red)),
                                    TextSpan(
                                        text: ' Read more',
                                        style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.purple)),
                                  ]),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black)),
                      height: 40,
                      width: 80,
                      child: Center(
                        child: Text(
                          "Show all",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, letterSpacing: 0.2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 900,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(color: Colors.grey),
                    ListTile(
                      title: Text('Hosted By Calvin'),
                      subtitle: Text('joined 2 mon ago'),
                      trailing: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile-placeholder.jpg'),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star),
                        SizedBox(width: 10),
                        Text('252 reviews'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.verified_user),
                        SizedBox(width: 10),
                        Text('Identity verified'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.medal),
                        SizedBox(width: 10),
                        Text('252 reviews'),
                      ],
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut '
                        'labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores '
                        'et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem '
                        'ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et'
                        ' dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea.'),
                    SizedBox(height: 10),
                    Text('Lorem ipsum'),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut'
                        ' labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet.'),
                    SizedBox(height: 10),
                    Text('Lorem ipsum'),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut'
                        ' labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet.'),
                    SizedBox(height: 10),
                    Text('Languages : English , hindi'),
                    Text('Response rate : 99%'),
                    Text('Response time : within an hour'),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black)),
                      height: 40,
                      width: 80,
                      child: Center(
                        child: Text(
                          "Contact Host",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, letterSpacing: 0.2),
                        ),
                      ),
                    ),
                    Divider(color: Colors.grey),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: Text('Availability'),
                    contentPadding: EdgeInsets.zero,
                    subtitle: Text('19-21 Nov'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('House Rules'),
                    subtitle: Text('Check in: After 14:00'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Health & Safety'),
                    subtitle: Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Cancellation Policy'),
                    subtitle: Text('Free cancellation 48 hours'),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(color: Colors.grey),
                  Text('Report'),
                  SizedBox(height: 60)
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
