import 'package:airbnb_clone/screens/demo/panelWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../constants.dart';
import '../Gmap_explore_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final panelController = PanelController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        panelSnapping: false,
        backdropEnabled: true,
        maxHeight: MediaQuery.of(context).size.height,
        minHeight: 150,
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        controller: panelController,
        color: Colors.transparent,
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/hero-image.jpg'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 15,
                      right: 15,
                      top: 50,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GmapExplore()));
                        },
                        child: Material(
                          elevation: 10,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.search_sharp,
                                    size: 20, color: KThemeColor),
                                SizedBox(width: 10),
                                Text(
                                  "Where are you going ?",
                                  style: TextStyle(
                                      color: KThemeColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13,
                                      letterSpacing: 0.2),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 205,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 33,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Not sure where to go?',
                                style: KThemeColorBold),
                            Text('Perfect.', style: KThemeColorBold),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 110,
                      right: 110,
                      bottom: 150,
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 40,
                          child: Center(
                              child: Text(
                            "I'm flexible",
                            style: TextStyle(
                                color: KThemeColor,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.2),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                ))
          ],
        ),
        // body: Column(
        //   children: [
        //     Expanded(
        //       flex: 4,
        //       child: Container(
        //         decoration: BoxDecoration(
        //           image: DecorationImage(
        //             image: AssetImage('assets/images/hero-image.jpg'),
        //             fit: BoxFit.fitWidth,
        //           ),
        //         ),
        //       ),
        //     ),
        //     Expanded(flex: 1, child: Container(height: 10))
        //   ],
        // ),
        panelBuilder: (ScrollController sc) => PanelWidget(sc: sc),
      ),
    );
  }
}
