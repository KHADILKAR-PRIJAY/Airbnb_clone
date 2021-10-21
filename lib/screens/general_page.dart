import 'package:airbnb_clone/constants.dart';
import 'package:airbnb_clone/screens/explore_page.dart';
import 'package:airbnb_clone/screens/wishlist_page.dart';
import 'package:airbnb_clone/screens/inbox_page.dart';
import 'package:airbnb_clone/screens/profile_page.dart';
import 'package:airbnb_clone/screens/trips_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GeneralPage extends StatefulWidget {
  const GeneralPage({Key? key}) : super(key: key);

  @override
  _GeneralPageState createState() => _GeneralPageState();
}

class _GeneralPageState extends State<GeneralPage> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages() =>
      <Widget>[Explore(), WishList(), Trips(), Inbox(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages().elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 10,
          unselectedFontSize: 10,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.grey,
          selectedItemColor: KThemeColor,
          //  backgroundColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.search,
                ),
              ),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.favorite),
              ),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Transform.rotate(
                    angle: 0.9, child: Icon(Icons.airplanemode_active_rounded)),
              ),
              label: 'Trips',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.chat_bubble_outline),
              ),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(Icons.person),
              ),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex, //New
          onTap: _onItemTapped,
        ));
  }
}
