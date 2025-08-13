import 'package:flutter/material.dart';
import 'profile_page2.dart';

class ProfilePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Page 1")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Profile Page 2"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => ProfilePage2()),
            );
          },
        ),
      ),
    );
  }
}
