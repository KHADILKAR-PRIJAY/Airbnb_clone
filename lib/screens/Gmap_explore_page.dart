import 'package:airbnb_clone/data/data.dart';
import 'package:airbnb_clone/screens/room_detail_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

const TextStyle label =
    TextStyle(color: KThemeColor, fontWeight: FontWeight.w600);

class GmapExplore extends StatefulWidget {
  @override
  _GmapExploreState createState() => _GmapExploreState();
}

class _GmapExploreState extends State<GmapExplore> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/map.PNG'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Positioned(
            left: 15,
            right: 15,
            top: 50,
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back,
                              size: 20, color: KThemeColor)),
                      Text('mumbai', style: KThemeColorBold),
                      SizedBox(width: 10),
                      Text(
                        "Weekend in Oct,No...",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            letterSpacing: 0.2),
                      ),
                      Container(
                        color: Colors.grey,
                        width: 1,
                        height: double.infinity,
                      ),
                      Icon(Icons.segment_rounded),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              minChildSize: 0.1,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.zero,
                        bottomLeft: Radius.zero),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Container(
                          height: 3.5,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Color(0xff7A7A7A),
                              borderRadius: BorderRadius.circular(2)),
                        ),
                        //Text('300+ places to stay'),
                        Expanded(
                          child: ListView.builder(
                              controller: scrollController,
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                RoomDetail()));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: Colors.white54,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              CarouselSlider.builder(
                                                options: CarouselOptions(
                                                  onPageChanged:
                                                      (index, reason) {
                                                    setState(() {
                                                      _currentIndex = index;
                                                    });
                                                  },
                                                  autoPlay: true,
                                                  autoPlayInterval:
                                                      Duration(seconds: 5),
                                                  autoPlayAnimationDuration:
                                                      Duration(
                                                          milliseconds: 800),
                                                  autoPlayCurve:
                                                      Curves.fastOutSlowIn,
                                                  height: 200.0,
                                                  viewportFraction: 1,
                                                ),
                                                itemCount: listPaths.length,
                                                itemBuilder: (BuildContext
                                                            context,
                                                        int itemIndex,
                                                        int pageViewIndex) =>
                                                    Stack(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              6.0),
                                                      child: Container(
                                                        height: 200,
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15),
                                                            color: Colors.grey,
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: KTealColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                        ),
                                                        child: Center(
                                                            child: Text(
                                                          'SUPERHOST  ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      top: 15,
                                                      right: 15,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color:
                                                                    KTealColor),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          child: Icon(
                                                              Icons.favorite,
                                                              color:
                                                                  Colors.white,
                                                              size: 16),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children:
                                                        listPaths.map((url) {
                                                      int index = listPaths
                                                          .indexOf(url);
                                                      return Container(
                                                        width: _currentIndex ==
                                                                index
                                                            ? 8
                                                            : 6,
                                                        height: _currentIndex ==
                                                                index
                                                            ? 7
                                                            : 5,
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 10.0,
                                                                horizontal:
                                                                    2.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: _currentIndex ==
                                                                  index
                                                              ? Colors.white
                                                              : Color(
                                                                  0xffC8C8C8),
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text('★ 4.89 (257)',
                                                      style: TextStyle(
                                                          color: KTealColor,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                  Text('Private room - Mumbai',
                                                      style: label),
                                                  Text(
                                                      'Nature lodge w/balcony perfect couple &...…..',
                                                      style: label),
                                                  Text('₹ 2000 / night',
                                                      style: label)
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              '₹2000 total',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 10),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 6.0,
                                                        horizontal: 8),
                                                child: Text(
                                                  '12 Nov - 14 Nov',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                      color: Colors.black)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
