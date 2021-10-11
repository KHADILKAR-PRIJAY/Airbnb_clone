import 'package:airbnb_clone/data/data.dart';
import 'package:flutter/material.dart';

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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 45),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(35),
                            borderSide: BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: 'Where are you going?',
                          hintStyle: TextStyle(fontSize: 15),
                          contentPadding: EdgeInsets.all(6)),
                    ),
                  ),
                  // Text('Not sure where to go?'),
                  // Text('perfect'),
                  // Text('I m flexible')
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //color: Colors.pink,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Explore nearby'),
                      SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 100,
                                  childAspectRatio: 1 / 2,
                                  crossAxisSpacing: 0,
                                  mainAxisSpacing: 40),
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/hero2.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(width: 10),
                                Text('Mumbai')
                              ],
                            );
                          },
                        ),
                      ),
                      Text('Live anywhere'),
                      Container(
                        height: 250,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: images.length,
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
                                                '${images[index]['Image']}'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('${images[index]['label']}'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(height: 300, color: Colors.pink),
                      Text('Discover'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 250,
                                    //childAspectRatio: 1 / 2,
                                    //crossAxisSpacing: 30,
                                    mainAxisSpacing: 20),
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 20,
                                width: 30,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/hero2.jpg'),
                                        fit: BoxFit.fitHeight)),
                              );
                            },
                          ),
                        ),
                      ),
                      Text('Stay Informed'),
                      Container(height: 500, color: Colors.blue),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
