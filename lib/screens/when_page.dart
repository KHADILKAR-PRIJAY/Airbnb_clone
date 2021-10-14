import 'package:flutter/material.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import '../constants.dart';

class WhenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Container(
                    width: 230,
                    child: Text('When will you be there ?',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.w500)),
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
                              monthLabelAlign: MainAxisAlignment.start,
                              monthLabelStyle: TextStyle(
                                  color: KThemeColor,
                                  fontWeight: FontWeight.bold),
                              selectedDateColor: KThemeColor,
                              selectDateRadius: 10,
                              minDate: DateTime.now(),
                              maxDate: DateTime.now().add(
                                Duration(days: 365),
                              ),
                              renderPostAndPreviousMonthDates: true,
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
