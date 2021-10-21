import 'package:airbnb_clone/data/data.dart';
import 'package:airbnb_clone/screens/request_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

const TextStyle themeSemiBold =
    TextStyle(color: KThemeColor, fontSize: 16, fontWeight: FontWeight.w500);
const TextStyle themeSemiBold2 =
    TextStyle(color: KThemeColor, fontSize: 14, fontWeight: FontWeight.w500);
const TextStyle regularGrey = TextStyle(fontSize: 12, color: Colors.grey);
const TextStyle regularTheme = TextStyle(fontSize: 12, color: KThemeColor);

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
      bottomNavigationBar: Material(
        elevation: 20,
        child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text('₹ 2000', style: themeSemiBold),
                        Text('/ night', style: themeSemiBold2),
                      ],
                    ),
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
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        backwardsCompatibility: true,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 3.0,
              ),
            ], shape: BoxShape.circle, color: Colors.white),
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
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 3.0,
                ),
              ], shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.upload_sharp, color: KTealColor, size: 16),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 3.0,
                ),
              ], shape: BoxShape.circle, color: Colors.white),
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
              child: Container(
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Nature lodge balcony perfect for couple & work',
                      style: TextStyle(
                          color: KThemeColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '★ 4.89 (257)',
                            style: TextStyle(color: KTealColor),
                          ),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.medal,
                                  color: KTealColor, size: 13),
                              SizedBox(width: 5),
                              Text('Superhost - Mumbai, india',
                                  style: TextStyle(color: KTealColor)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Divider(color: Colors.grey),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt',
                        style: themeSemiBold2),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Divider(color: Colors.grey),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy',
                        style: themeSemiBold),
                    Text('Lorem ipsum dolor sit amet.', style: themeSemiBold2),
                    Text(
                        'lorem   \u2022   lorem   \u2022   lorem   \u2022   lorem',
                        style: themeSemiBold2)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Divider(color: Colors.grey),
                    Text('Lorem ipsum', style: themeSemiBold2),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.',
                        style: regularTheme),
                    Text('Lorem ipsum dolor sit amet,', style: themeSemiBold2),
                    Text('Lorem ipsum', style: regularTheme),
                    Text('Lorem ipsum dolor sit amet.', style: themeSemiBold2)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 230,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Divider(color: Colors.grey),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor'
                        ' invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et '
                        'accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata '
                        'sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing '
                        'elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, '
                        'sed diam voluptua. At vero eos et accusam et justo duo dolores et ea.',
                        style: regularTheme),
                    Text('Lorem ipsum',
                        style: TextStyle(
                            color: KThemeColor,
                            fontSize: 12,
                            decoration: TextDecoration.underline)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.grey),
                    Text("Where you'll sleep", style: themeSemiBold),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(FontAwesomeIcons.bed,
                                        color: KTealColor),
                                    Icon(Icons.king_bed_sharp,
                                        color: KTealColor),
                                  ],
                                ),
                              ),
                            ),
                            Text('Lorem ipsum', style: themeSemiBold2),
                            Text('Lorem ipsum dolor sit amet,',
                                style: regularTheme),
                          ],
                        ),
                      ),
                      height: 100,
                      width: 170,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(color: Colors.grey),
                    Text('What this place offers', style: themeSemiBold),
                    Text('Lorem ipsum', style: themeSemiBold2),
                    Text('Lorem ipsum', style: themeSemiBold2),
                    Text('Lorem ipsum', style: themeSemiBold2),
                    Text('Lorem ipsum', style: themeSemiBold2),
                    Text('Lorem ipsum', style: themeSemiBold2),
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
                height: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Divider(color: Colors.grey),
                    Text('Accessibility', style: themeSemiBold),
                    Text('Lorem ipsum', style: themeSemiBold2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lorem ipsum dolor sit amet.',
                            style: themeSemiBold2),
                        Container(
                          height: 20,
                          width: 20,
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage('assets/images/map.PNG')),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lorem ipsum dolor sit amet.',
                            style: themeSemiBold2),
                        Container(
                          height: 20,
                          width: 20,
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage('assets/images/map.PNG')),
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
                height: 380,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Divider(color: Colors.grey),
                    Text("Where you'll be", style: themeSemiBold),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage('assets/images/map.PNG')),
                          border: Border.all(color: Colors.black)),
                    ),
                    Text('Mumbai , Maharasthra', style: themeSemiBold2),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod '
                        'tempor invidunt ut labore et dolore magna aliquyam erat, sed diam.',
                        style: regularTheme),
                    Text('Lorem ipsum',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: KThemeColor,
                            fontSize: 12))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 320,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Divider(color: Colors.grey),
                    Text('★ 4.89  \u2022  257 reviews',
                        style: TextStyle(color: KTealColor)),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      title: Text('Lorem ipsum',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                      subtitle: Text('1 week ago',
                                          style: regularGrey),
                                      leading: CircleAvatar(
                                        backgroundImage: AssetImage(
                                            'assets/images/profile-placeholder.jpg'),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                              text:
                                                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor '
                                                  'invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam '
                                                  'et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10)),
                                          TextSpan(
                                              text: ' Read more..',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 10)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.black)),
                      height: 40,
                      width: double.infinity,
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
                      title: Text('Hosted By Calvin', style: themeSemiBold),
                      subtitle: Text('joined 2 mon ago', style: regularGrey),
                      trailing: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile-placeholder.jpg'),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: KThemeColor),
                        SizedBox(width: 10),
                        Text('252 reviews', style: themeSemiBold2),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.verified_user, color: KThemeColor),
                        SizedBox(width: 10),
                        Text('Identity verified', style: themeSemiBold2),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.medal, color: KThemeColor),
                        SizedBox(width: 10),
                        Text('252 reviews', style: themeSemiBold2),
                      ],
                    ),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut '
                        'labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores '
                        'et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem '
                        'ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et'
                        ' dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea.',
                        style: regularGrey),
                    SizedBox(height: 10),
                    Text('Lorem ipsum', style: themeSemiBold2),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut'
                        ' labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet.',
                        style: regularTheme),
                    SizedBox(height: 10),
                    Text('Lorem ipsum', style: themeSemiBold2),
                    Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut'
                        ' labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet.',
                        style: regularTheme),
                    SizedBox(height: 10),
                    Text('Languages : English , hindi', style: regularTheme),
                    Text('Response rate : 99%', style: regularTheme),
                    Text('Response time : within an hour', style: regularTheme),
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
                    title: Text('Availability', style: themeSemiBold),
                    contentPadding: EdgeInsets.zero,
                    subtitle: Text('19-21 Nov', style: regularGrey),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('House Rules', style: themeSemiBold),
                    subtitle: Text('Check in: After 14:00', style: regularGrey),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Health & Safety', style: themeSemiBold),
                    subtitle: Text(
                        'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna.',
                        style: regularGrey),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(color: Colors.grey),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text('Cancellation Policy', style: themeSemiBold),
                    subtitle:
                        Text('Free cancellation 48 hours', style: regularGrey),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  Divider(color: Colors.grey),
                  SizedBox(height: 10),
                  Text('Report',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.underline)),
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
