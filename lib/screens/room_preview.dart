import 'package:airbnb_clone/constants.dart';
import 'package:airbnb_clone/data/data.dart';
import 'package:airbnb_clone/screens/room_detail_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

const TextStyle label =
    TextStyle(color: KThemeColor, fontWeight: FontWeight.w600);
const TextStyle subLabel = TextStyle(color: KTealColor, fontSize: 10);

class RoomPreview extends StatefulWidget {
  @override
  _RoomPreviewState createState() => _RoomPreviewState();
}

class _RoomPreviewState extends State<RoomPreview> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: KTealColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Mumbai',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 175,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              DateAlertBox();
                            },
                            child: Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Center(
                                  child: Text(
                                'Dates',
                                style: TextStyle(color: Colors.grey),
                              )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              GuestAlertBox();
                            },
                            child: Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Center(
                                  child: Text(
                                'Guest',
                                style: TextStyle(color: Colors.grey),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Color(0xff9B9B9B),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RoomDetail()));
                    },
                    child: Container(
                      color: Colors.white54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 5),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  height: 200.0,
                                  viewportFraction: 1,
                                ),
                                itemCount: listPaths.length,
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Container(
                                        height: 200,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: Colors.grey,
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                    '${listPaths[itemIndex]}'))),
                                      ),
                                    ),
                                    Positioned(
                                      top: 15,
                                      left: 15,
                                      child: Container(
                                        height: 21,
                                        width: 86,
                                        decoration: BoxDecoration(
                                          color: KTealColor,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        child: Center(
                                            child: Text(
                                          'SUPERHOST  ',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500),
                                        )),
                                      ),
                                    ),
                                    Positioned(
                                      top: 15,
                                      right: 15,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: KTealColor),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(Icons.favorite,
                                              color: Colors.white, size: 16),
                                        ),
                                      ),
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
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('★ 4.89 (257)',
                                      style: TextStyle(
                                          color: KTealColor,
                                          fontWeight: FontWeight.w600)),
                                  Text('Private room - Mumbai', style: label),
                                  Text(
                                      'Nature lodge w/balcony perfect couple &...…..',
                                      style: label),
                                  Text('₹ 2000 / night', style: label)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  elevation: 10,
                  shadowColor: KThemeColor,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: KThemeColor,
                    ),
                    height: 30,
                    width: 80,
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map, color: Colors.white, size: 12),
                        SizedBox(width: 4),
                        Text(
                          "Map",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.2,
                              fontSize: 10),
                        ),
                      ],
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void DateAlertBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.all(0),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: 400,
              padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Text("You can make cool stuff!"),
            )));
  }

  void GuestAlertBox() {
    showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.all(0),
            child: Container(
              width: double.infinity,
              height: 400,
              //padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close)),
                        SizedBox(width: 125),
                        Text('Guest', style: label),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Adults', style: label),
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.remove_circle_outline_outlined,
                                  color: Colors.grey),
                              Text('1'),
                              Icon(Icons.add_circle_outline,
                                  color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Children', style: label),
                            SizedBox(height: 2),
                            Text('Age 2-12', style: subLabel),
                          ],
                        ),
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.remove_circle_outline_outlined,
                                  color: Colors.grey),
                              Text('0'),
                              Icon(Icons.add_circle_outline,
                                  color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Infants', style: label),
                            SizedBox(height: 2),
                            Text('Under 2', style: subLabel),
                          ],
                        ),
                        Container(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.remove_circle_outline_outlined,
                                  color: Colors.grey),
                              Text('0'),
                              Icon(Icons.add_circle_outline,
                                  color: Colors.grey),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Clear"),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: KThemeColor,
                          ),
                          height: 30,
                          width: 80,
                          child: Center(
                              child: Text(
                            "Save",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2,
                                fontSize: 10),
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}
