import 'package:flutter/material.dart';
import 'package:iraq_bank/controller/textstyle.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: Text(
            "Info Page",
            style: CustomTextStyle.f20w,
          ),
        ));
  }
}
