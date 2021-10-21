import 'package:flutter/material.dart';
import '../constants.dart';

const TextStyle label =
    TextStyle(color: KThemeColor, fontWeight: FontWeight.w600);
const TextStyle subLabel = TextStyle(color: KTealColor, fontSize: 10);

class AgeGroup extends StatelessWidget {
  const AgeGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
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
              Text(
                'Skip',
                style: TextStyle(
                    color: KThemeColor, decoration: TextDecoration.underline),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: KThemeColor,
                  ),
                  height: 30,
                  width: 80,
                  child: Center(
                      child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.2,
                        fontSize: 10),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.centerLeft,
                end: FractionalOffset.centerRight,
                colors: [
                  KTealColor,
                  KThemeColor,
                ],
                stops: [0.0, 1.0],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 18),
                  child: Hero(
                    tag: 'title',
                    child: Container(
                      width: 230,
                      child: Material(
                        color: Colors.transparent,
                        child: Text('When will you be there ?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 27,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(Icons.arrow_back, size: 20)),
                                  SizedBox(width: 115),
                                  Text('Mumbai', style: KThemeColorBold)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 250,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Adults', style: label),
                                          SizedBox(height: 2),
                                          Text('Age 12 or above',
                                              style: subLabel),
                                        ],
                                      ),
                                      Container(
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                                Icons
                                                    .remove_circle_outline_outlined,
                                                color: Colors.grey),
                                            Text('1'),
                                            Icon(Icons.add_circle_outline,
                                                color: Colors.grey),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(color: Colors.grey),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Children', style: label),
                                          SizedBox(height: 2),
                                          Text('Age 2-12', style: subLabel),
                                        ],
                                      ),
                                      Container(
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                                Icons
                                                    .remove_circle_outline_outlined,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Infants', style: label),
                                          SizedBox(height: 2),
                                          Text('Under 2', style: subLabel),
                                        ],
                                      ),
                                      Container(
                                        width: 100,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Icon(
                                                Icons
                                                    .remove_circle_outline_outlined,
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
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
