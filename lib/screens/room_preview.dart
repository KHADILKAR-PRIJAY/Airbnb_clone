import 'package:airbnb_clone/constants.dart';
import 'package:flutter/material.dart';

class RoomPreview extends StatelessWidget {
  const RoomPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: KTealColor,
                  ),
                ),
              ),
              Text('room preview'),
            ],
          ),
        ),
      ),
    );
  }
}
