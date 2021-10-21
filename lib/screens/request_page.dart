import 'package:airbnb_clone/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const TextStyle label =
    TextStyle(color: KThemeColor, fontWeight: FontWeight.w600);
const TextStyle subLabel = TextStyle(color: KTealColor, fontSize: 10);
const double height = 20;
const TextStyle themeBold =
    TextStyle(fontWeight: FontWeight.bold, color: KThemeColor, fontSize: 17);
const TextStyle greyUnderline = TextStyle(
    color: Colors.grey, fontSize: 11.5, decoration: TextDecoration.underline);
const TextStyle regularTheme = TextStyle(color: KThemeColor, fontSize: 12);
const TextStyle semiBoldGrey =
    TextStyle(color: Colors.grey, fontWeight: FontWeight.w500);
const TextStyle semiBoldTheme =
    TextStyle(color: KThemeColor, fontWeight: FontWeight.w500);

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  Object? val = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 35,
        title: Text('Request to book', style: TextStyle(color: KThemeColor)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: KTealColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              //height: 180,
              padding: EdgeInsets.all(12),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixid'
                              '=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzb3J0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
                            ),
                          ),
                        ),
                        height: 90,
                        width: 85,
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Private room in villa in Mumbai',
                                style: regularTheme),
                            SizedBox(height: 2),
                            Text(
                                'Nature lodge balcony perfect for couple & work',
                                style: label),
                            SizedBox(height: 2),
                            Text('lorem   \u2022   lorem', style: regularTheme),
                            SizedBox(height: 2),
                            Row(
                              children: [
                                Text('★ 4.89 (257) ',
                                    style: TextStyle(
                                        color: KTealColor, fontSize: 12)),
                                SizedBox(width: 10),
                                Icon(FontAwesomeIcons.medal,
                                    color: KTealColor, size: 10),
                                SizedBox(width: 4),
                                Text('Superhost - Mumbai, india',
                                    style: TextStyle(
                                        color: KTealColor, fontSize: 12))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 25),
                  Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.',
                      style: regularTheme)
                ],
              ),
            ),
            SizedBox(height: height),
            Container(
              height: 130,
              padding: EdgeInsets.all(12),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Your Trip', style: themeBold),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your Trip', style: label),
                          SizedBox(height: 2),
                          Text('19 Nov - 21 Nov', style: subLabel),
                        ],
                      ),
                      Text('Edit', style: greyUnderline)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Guest', style: label),
                          SizedBox(height: 2),
                          Text('1 guest', style: subLabel),
                        ],
                      ),
                      Text('Edit', style: greyUnderline)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height),
            Container(
              height: 190,
              padding: EdgeInsets.all(12),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Choose how to pay', style: themeBold),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pay in full', style: label),
                          SizedBox(height: 2),
                          Text('Pay the total ( ₹ 2000 )', style: subLabel),
                        ],
                      ),
                      Radio(
                        value: 2,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                        activeColor: KThemeColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pay part now , part later', style: label),
                          SizedBox(height: 2),
                          Container(
                            width: 270,
                            child: Text(
                                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy '
                                'eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et.',
                                style: subLabel),
                          ),
                        ],
                      ),
                      Radio(
                        value: 1,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value;
                          });
                        },
                        activeColor: KThemeColor,
                      ),
                    ],
                  ),
                  Text('More info', style: greyUnderline),
                ],
              ),
            ),
            SizedBox(height: height),
            Container(
              height: 230,
              padding: EdgeInsets.all(12),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Price Details', style: themeBold),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('₹ 2000 * 2 nights', style: semiBoldGrey),
                      Text('₹ 2000', style: semiBoldGrey)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cleaning fee', style: semiBoldGrey),
                      Text('₹ 20', style: semiBoldGrey)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service fee', style: semiBoldGrey),
                      Text('₹ 2000',
                          style: TextStyle(
                              color: KTealColor, fontWeight: FontWeight.w500))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Occupancy taxes and fees', style: semiBoldGrey),
                      Text('₹ 20', style: semiBoldGrey)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total (GBP)', style: label),
                      Text('₹ 20', style: label)
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text('More info', style: greyUnderline),
                  ),
                ],
              ),
            ),
            SizedBox(height: height),
            Container(
              height: 190,
              padding: EdgeInsets.all(12),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Pay with', style: themeBold),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Payment method', style: semiBoldTheme),
                      Container(
                        width: 70,
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(child: Text('Add')),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.ccVisa),
                      SizedBox(width: 30),
                      Icon(FontAwesomeIcons.ccPaypal),
                      SizedBox(width: 30),
                      Icon(FontAwesomeIcons.googlePay),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text('Enter a coupon', style: greyUnderline),
                ],
              ),
            ),
            SizedBox(height: height),
            Container(
              height: 300,
              padding: EdgeInsets.all(12),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Message the host', style: themeBold),
                  SizedBox(height: 4),
                  Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.',
                      style: semiBoldTheme),
                  ListTile(
                    contentPadding: EdgeInsets.all(0),
                    title: Text('Lorem ipsum',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text('1 week ago',
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/images/profile-placeholder.jpg'),
                    ),
                  ),
                  TextFormField(
                    minLines: 5,
                    maxLines: 7,
                    decoration: InputDecoration(
                      hintText: "Hi Calvin ! I'll be visiting.....",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height),
            Container(
              color: Colors.white,
              height: 170,
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Cancellation policy', style: themeBold),
                  Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.',
                      style: regularTheme),
                  Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.',
                      style: regularTheme),
                ],
              ),
            ),
            SizedBox(height: height),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(12),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                minVerticalPadding: 0.1,
                leading:
                    Icon(FontAwesomeIcons.calendarCheck, color: KTealColor),
                title: Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod.',
                    style: themeBold),
                subtitle: Text('Lorem ipsum dolor sit ame',
                    style: TextStyle(fontSize: 12)),
              ),
            ),
            SizedBox(height: height),
            Container(
              padding: EdgeInsets.all(12),
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor'
                      ' invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam '
                      'et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem '
                      'ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur.',
                      style: TextStyle(color: KThemeColor, fontSize: 9)),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: KThemeColor,
                    ),
                    height: 40,
                    width: 80,
                    child: Center(
                      child: Text(
                        "Request to book",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
