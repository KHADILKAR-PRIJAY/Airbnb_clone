import 'package:flutter/material.dart';

import 'mainPage.dart';

class TripDemo extends StatelessWidget {
  final String title = 'Social App Design';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(),
      );
}
