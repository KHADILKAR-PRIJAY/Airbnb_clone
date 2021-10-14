import 'package:airbnb_clone/data/data.dart';
import 'package:airbnb_clone/screens/Gmap_explore_page.dart';
import 'package:airbnb_clone/screens/looking_for_page.dart';
import 'package:airbnb_clone/screens/trips_page.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

const TextStyle label =
    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 12);

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(color: Colors.pink, height: 40, width: 500),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('GO ANYWHERE, ANYTIME', style: label),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GmapExplore()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "I'm flexible",
                            style: TextStyle(
                                color: KThemeColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                letterSpacing: 0.2),
                          ),
                          Icon(Icons.arrow_forward_ios,
                              color: KThemeColor, size: 17)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('GETAWAYS NEAR YOU', style: label),
              ),
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: smallImages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, SlideRightRoute(page: LookingFor()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${smallImages[index]['Image']}'),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${smallImages[index]['label']}',
                                      style: ThemeColorBold2,
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      '6 hr drive',
                                      style: TealColorRegular,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(color: Colors.grey)
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
