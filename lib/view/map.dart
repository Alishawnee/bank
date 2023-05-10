import 'package:flutter/material.dart';

class Mapp extends StatelessWidget {
  const Mapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "images/map.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
