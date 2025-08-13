import 'package:flutter/material.dart';
import 'favorite_page2.dart';

class FavoritePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Page 1")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Favorite Page 2"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => FavoritePage2()),
            );
          },
        ),
      ),
    );
  }
}
