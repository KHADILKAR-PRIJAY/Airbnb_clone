import 'package:airbnb_clone/screens/age_group_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import '../constants.dart';

const TextStyle weekday =
    TextStyle(color: Colors.grey, fontSize: 12, height: 4);

class WhenPage extends StatelessWidget {
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
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AgeGroup()));
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
                      child: Text('When will you be there ?',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none)),
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
                          Expanded(child: TabBarSection())
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

class TabBarSection extends StatefulWidget {
  @override
  _TabBarSectionState createState() => _TabBarSectionState();
}

class _TabBarSectionState extends State<TabBarSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String lab = 'weekend';
  bool weekend = true;
  bool week = false;
  bool month = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: 200,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.white,
                ),
                labelColor: KThemeColor,
                unselectedLabelColor: KThemeColor,
                labelStyle:
                    TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                tabs: [
                  Tab(
                    text: 'Calendar',
                  ),
                  Tab(
                    text: "I'm flexible",
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),

          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Mon', style: weekday),
                          Text('Tue', style: weekday),
                          Text('Wed', style: weekday),
                          Text('Thu', style: weekday),
                          Text('Fri', style: weekday),
                          Text('Sat', style: weekday),
                          Text('Sun', style: weekday),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ScrollableCleanCalendar(
                        onRangeSelected: (firstDate, secondDate) {
                          print('onRangeSelected first $firstDate');
                          print('onRangeSelected second $secondDate');
                        },
                        onTapDate: (date) {
                          print('onTap $date');
                        },
                        showDaysWeeks: false,
                        rangeSelectedDateColor: KTealColor,
                        monthLabelAlign: MainAxisAlignment.start,
                        monthLabelStyle: TextStyle(
                            color: KThemeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.5),
                        selectedDateColor: KThemeColor,
                        minDate: DateTime.now(),
                        maxDate: DateTime.now().add(
                          Duration(days: 365),
                        ),
                        renderPostAndPreviousMonthDates: true,
                      ),
                    ),
                  ],
                ),

                // second tab bar view widget
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Stay for a ${lab}', style: KThemeColorBold),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                week = false;
                                weekend = true;
                                month = false;
                                lab = 'weekend';
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 90,
                              child: Center(
                                child: Text(
                                  'Weekend',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: (weekend)
                                          ? Colors.black
                                          : Colors.grey),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color:
                                        (weekend) ? Colors.black : Colors.grey),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                weekend = false;
                                week = true;
                                month = false;
                                lab = 'week';
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 90,
                              child: Center(
                                child: Text(
                                  'Week',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color:
                                          (week) ? Colors.black : Colors.grey),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color: (week) ? Colors.black : Colors.grey),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                week = false;
                                weekend = false;
                                month = true;
                                lab = 'month';
                              });
                            },
                            child: Container(
                              height: 27,
                              width: 90,
                              child: Center(
                                child: Text('Month',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: (month)
                                            ? Colors.black
                                            : Colors.grey)),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    color:
                                        (month) ? Colors.black : Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text('Go in October , November', style: KThemeColorBold),
                      SizedBox(height: 15),
                      Container(
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 8),
                              child: Container(
                                height: 100,
                                width: 90,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(FontAwesomeIcons.calendarAlt,
                                        size: 40),
                                    Text('October',
                                        style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Color(0xff707070),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
