import 'package:flutter/material.dart';
import 'package:iraq_bank/controller/textstyle.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "كشف الحساب",
          style: CustomTextStyle.f20w,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ActionChip(
                onPressed: () {},
                label: const Text(" : رصيد حسابك الحالي "),
                labelStyle: CustomTextStyle.f25b,
                padding: const EdgeInsets.only(top: 5, bottom: 5, right: 30, left: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ActionChip(
                onPressed: () {},
                label: const Text("1,250.00 "),
                labelStyle: CustomTextStyle.f25b,
                avatar: const Icon(Icons.attach_money, size: 30),
                padding: const EdgeInsets.only(top: 20, bottom: 20, right: 50, left: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
