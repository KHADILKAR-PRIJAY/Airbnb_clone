import 'package:airbnb_clone/constants.dart';
import 'package:flutter/material.dart';

class TextPage extends StatelessWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 62,
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.grey,
                    width: 0.7,
                  ),
                )),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: KTealColor,
                      ),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                        radius: 23,
                        backgroundImage: AssetImage(
                            'assets/images/profile-placeholder.jpg')),
                    SizedBox(width: 15),
                    Text('Lorem ipsum'),
                  ],
                ),
              ),
              Column(
                children: [
                  //Expanded(child: ChatMessageList()),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              child: Container(
                                  color: KTealColor,
                                  //height: 30,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Write message here.....',
                                        hintStyle: TextStyle(
                                            color: Colors.grey, fontSize: 15),
                                        contentPadding: EdgeInsets.all(10),
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none),
                                    // controller: _controller,
                                  ))),
                          Container(height: 48, width: 1.5),
                          GestureDetector(
                            child: Container(
                                height: 48,
                                width: 50,
                                color: KTealColor,
                                child: Icon(Icons.send, color: Colors.white)),
                            onTap: () {
                              //sendMessage();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
