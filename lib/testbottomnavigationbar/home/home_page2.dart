import 'package:flutter/material.dart';
import 'home_page3.dart';

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page 2")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Home Page 3"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => HomePage3()),
            );
          },
        ),
      ),
    );
  }
}
