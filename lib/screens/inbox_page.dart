import 'package:airbnb_clone/constants.dart';
import 'package:airbnb_clone/screens/text_page.dart';
import 'package:flutter/material.dart';

//
// class Inbox extends StatefulWidget {
//   const Inbox({Key? key}) : super(key: key);
//
//   @override
//   _InboxState createState() => _InboxState();
// }
//
// class _InboxState extends State<Inbox> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             children: [
//               Text('Inbox', style: KPageHeader),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
class Inbox extends StatefulWidget {
  @override
  _InboxState createState() => _InboxState();
}

class _InboxState extends State<Inbox> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Inbox', style: KPageHeader),
              SizedBox(height: 15),
              Container(
                height: 35,
                width: 200,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.withOpacity(0),
                    width: 0.7,
                  ),
                )),
                child: TabBar(
                  labelPadding: EdgeInsets.only(right: 4, left: 0),
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 2.0, color: KThemeColor),
                      insets: EdgeInsets.all(-1)),
                  controller: _tabController,
                  labelColor: KThemeColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: 'Messages',
                    ),
                    Tab(
                      text: 'Notification',
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1,
                height: 0,
                color: Colors.grey.withOpacity(0.5),
              ),
              // tab bar view here
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // first tab bar view widget
                    Messsages(context),
                    Notification(context)

                    // second tab bar view widget
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

Widget Messsages(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TextPage()));
                },
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          AssetImage('assets/images/profile-placeholder.jpg')),
                  title: Text(
                    'Lorem ipsum',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                  subtitle: Text(
                    'Lorem ipsum dolor sit amet, consetetur.',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: CircleAvatar(
                    radius: 4,
                    backgroundColor: KTealColor,
                  ),
                ),
              );
            }),
      ],
    ),
  );
}

Widget Notification(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Lorem ipsum',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: KThemeColor)),
                SizedBox(height: 5),
                Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore.',
                  style: TextStyle(fontSize: 12, color: KThemeColor),
                ),
              ],
            ),
          );
        }),
  );
}
