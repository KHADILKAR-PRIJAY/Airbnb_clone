import 'package:flutter/material.dart';

import '../constants.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 65,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.7,
                  ),
                )),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(
                            'assets/images/profile-placeholder.jpg')),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Lorem ipsum'),
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
            ],
          ),
        ),
      ),
    );
  }
}
