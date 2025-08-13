import 'package:flutter/material.dart';
import 'home_page2.dart';

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page 1")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Home Page 2"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => HomePage2()),
            );
          },
        ),
      ),
    );
  }
}
