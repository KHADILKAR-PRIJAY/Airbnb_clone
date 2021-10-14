import 'package:airbnb_clone/data/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
        bottomNavigationBar: Container(color: Colors.yellow, height: 50),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          backwardsCompatibility: true,
          leading: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(Icons.arrow_back_ios, color: KTealColor, size: 16),
            ),
          ),
          actions: [
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.upload_sharp, color: KTealColor, size: 16),
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(Icons.favorite, color: KTealColor, size: 16),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
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
              SizedBox(height: 500),
              Container(color: Colors.pink, height: 200)
            ],
          ),
        ));
    // return Scaffold(
    //   extendBodyBehindAppBar: true,
    //   body: CustomScrollView(
    //     slivers: <Widget>[
    //       SliverAppBar(
    //         title: Text(
    //           "Home",
    //           style: TextStyle(color: Colors.black),
    //         ),
    //         floating: false,
    //         pinned: true,
    //         snap: false,
    //         elevation: 10,
    //         backgroundColor: Colors.transparent,
    //       ),
    //       SliverList(
    //         delegate: SliverChildListDelegate([
    //           Column(
    //             children: [
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //               Text('cbkj'),
    //             ],
    //           ),
    //           Text('cbkj'),
    //         ]),
    //       ),
    //     ],
    //   ),
    // );
  }
}
