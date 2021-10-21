import 'package:airbnb_clone/constants.dart';
import 'package:airbnb_clone/data/data.dart';
import 'package:airbnb_clone/screens/Gmap_explore_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget divider = Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: Container(width: 160, height: 1, color: Color(0xff7A7A7A)));
const TextStyle ThemeColorBold =
    TextStyle(color: KThemeColor, fontWeight: FontWeight.bold, fontSize: 20);
const TextStyle ThemeColorBold2 =
    TextStyle(color: KThemeColor, fontWeight: FontWeight.bold, fontSize: 14);
const TextStyle ThemeColorRegular =
    TextStyle(color: KThemeColor, fontWeight: FontWeight.w500, fontSize: 16);
const TextStyle GreyColorRegular = TextStyle(color: Colors.grey, fontSize: 14);
const TextStyle TealColorRegular = TextStyle(color: KTealColor, fontSize: 12);
const double paddingInt = 10;
const double heightInt = 10;

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 450,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/hero2.jpg'),
                        fit: BoxFit.fitHeight,
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
                    bottom: 160,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 33,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Not sure where to go?', style: KThemeColorBold),
                          Text('Perfect.', style: KThemeColorBold),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 110,
                    right: 110,
                    bottom: 100,
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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: heightInt),
                  Padding(
                    padding: const EdgeInsets.all(paddingInt),
                    child: Text('Explore nearby', style: ThemeColorBold),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 100,
                          childAspectRatio: 1 / 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 40),
                      itemCount: smallImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(6),
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
                        );
                      },
                    ),
                  ),
                  SizedBox(height: heightInt),
                  Padding(
                    padding: const EdgeInsets.all(paddingInt),
                    child: Text('Live anywhere', style: ThemeColorBold),
                  ),
                  Container(
                    height: 255,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(paddingInt),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${images[index]['Image']}'),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('${images[index]['label']}',
                                    style: ThemeColorBold2),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(paddingInt),
                    child: Container(
                      height: 350,
                      child: Stack(children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.transparent,
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/images/hero2.jpg',
                              ),
                            ),
                          ),
                          height: 350.0,
                        ),
                        Container(
                          height: 350.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            gradient: LinearGradient(
                              begin: FractionalOffset.topCenter,
                              end: FractionalOffset.bottomCenter,
                              colors: [
                                KTealColor.withOpacity(0.8),
                                KThemeColor.withOpacity(0.7),
                              ],
                              stops: [0.0, 1.0],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Try Hosting',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Lorem ipsum dolor sit a  met, consetetur ipscing elitr, sed nonumy eirmod',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text('Learn more',
                                            style: ThemeColorRegular)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                  SizedBox(height: heightInt),
                  Padding(
                    padding: const EdgeInsets.all(paddingInt),
                    child: Text('Discover thing to do', style: ThemeColorBold),
                  ),
                  Container(
                    height: 270,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: DiscoverImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            '${DiscoverImages[index]['Image']}'),
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${DiscoverImages[index]['label']}',
                                      style: ThemeColorBold2,
                                    ),
                                    Text(
                                      'Lorem ipsum dolor sit amet.',
                                      style: TextStyle(
                                          color: Color(0xff7A7A7A),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: heightInt),
                  Container(
                    //height: 350,
                    width: MediaQuery.of(context).size.width,
                    color: Color(0xff9B9B9B).withOpacity(0.2),
                    child: Padding(
                      padding: const EdgeInsets.all(paddingInt),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Stay Informed', style: ThemeColorBold),
                          SizedBox(height: 20),
                          Container(
                            height: 250,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('For guests',
                                            style:
                                                TextStyle(color: KThemeColor)),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('For hosts',
                                            style:
                                                TextStyle(color: KThemeColor)),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('For COVID-19 responders',
                                            style:
                                                TextStyle(color: KThemeColor)),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 25),
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('More',
                                            style:
                                                TextStyle(color: KThemeColor)),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                        divider,
                                        Text('Lorem ipsum.',
                                            style: ThemeColorRegular),
                                        Text('Lorem ipsum.',
                                            style: GreyColorRegular),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
