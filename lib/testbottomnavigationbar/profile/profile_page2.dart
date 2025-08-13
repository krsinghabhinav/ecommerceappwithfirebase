import 'package:flutter/material.dart';
import 'profile_page3.dart';

class ProfilePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page 2")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Profile Page 3"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ProfilePage3()),
            );
          },
        ),
      ),
    );
  }
}
