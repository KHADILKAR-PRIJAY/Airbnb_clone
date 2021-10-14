import 'package:flutter/material.dart';
import '../constants.dart';

const TextStyle GreyTitle = TextStyle(
    color: Color(0xff7A7A7A), fontWeight: FontWeight.bold, fontSize: 12);
const TextStyle label = TextStyle(fontWeight: FontWeight.w500, fontSize: 14);
const TextStyle Greylabel = TextStyle(fontSize: 12, color: Color(0xff7A7A7A));
const padding = EdgeInsets.symmetric(vertical: 7.0);
const double sizeBoxHeight = 25;

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 75,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 1.7,
                  ),
                )),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    CircleAvatar(
                        radius: 22,
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(
                            'assets/images/profile-placeholder.jpg')),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Lorem ipsum',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        SizedBox(height: 10),
                        Text(
                          'Show profile',
                          style: TextStyle(color: KTealColor, fontSize: 13),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: padding,
                        child: Text('Account Settings', style: GreyTitle),
                      ),
                      Padding(
                        padding: padding,
                        child: Text('Personal Information', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Padding(
                        padding: padding,
                        child: Text('Payments & payouts', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Padding(
                        padding: padding,
                        child: Text('Notifications', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Padding(
                        padding: padding,
                        child: Text('Travel for work', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      SizedBox(height: sizeBoxHeight),
                      Padding(
                        padding: padding,
                        child: Text('Hosting', style: GreyTitle),
                      ),
                      Padding(
                        padding: padding,
                        child: Text('List your space', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Padding(
                        padding: padding,
                        child: Text('Learn about hosting', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Padding(
                        padding: padding,
                        child: Text('Host an experience', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      SizedBox(height: sizeBoxHeight),
                      Padding(
                        padding: padding,
                        child: Text('Support', style: GreyTitle),
                      ),
                      Padding(
                        padding: padding,
                        child: Text('How Airbnb works', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Text('Safety centre', style: label),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consetetur '
                            'sadipscing elitr, sed diam nonumy eirmod tempor',
                            style: Greylabel),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Padding(
                        padding: padding,
                        child:
                            Text('Contact neighbourhood support', style: label),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consetetur '
                            'sadipscing elitr, sed diam nonumy eirmod tempor',
                            style: Greylabel),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Padding(
                        padding: padding,
                        child: Text('Get help', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Padding(
                        padding: padding,
                        child: Text('Get us feedback', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      SizedBox(height: sizeBoxHeight),
                      Padding(
                        padding: padding,
                        child: Text('Legal', style: GreyTitle),
                      ),
                      Padding(
                        padding: padding,
                        child: Text('Terms of service', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      Padding(
                        padding: padding,
                        child: Text('Privacy settings', style: label),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      SizedBox(height: sizeBoxHeight),
                      Padding(
                        padding: padding,
                        child: Text('Log Out',
                            style: TextStyle(
                                color: Color(0xffFC1414),
                                fontWeight: FontWeight.w500)),
                      ),
                      Divider(color: Color(0xff9B9B9B)),
                      SizedBox(height: 30),
                      Center(child: Text('Version 0.1', style: Greylabel)),
                      SizedBox(height: 100)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
