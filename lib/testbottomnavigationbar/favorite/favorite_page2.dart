import 'package:flutter/material.dart';
import 'favorite_page3.dart';

class FavoritePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite Page 2")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Favorite Page 3"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => FavoritePage3()),
            );
          },
        ),
      ),
    );
  }
}
