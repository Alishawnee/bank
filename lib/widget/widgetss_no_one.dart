import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iraq_bank/controller/textstyle.dart';
import 'package:iraq_bank/pages/store.dart';
import 'package:iraq_bank/view/accountpage.dart';
import 'package:iraq_bank/view/map.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});
  final bool _showbackside = false;
  final String _appbartext = " معلومات بطاقة الدفع";
  final String _bankname = "البنك العراقي";
  final String _cardnumber = "1234 5678 9000 1111";
  final String _textExpDate = "Exp. Date";
  final String _cardexpiry = "12 / 24";
  final String _holdername = "NOOR JABER";
  final String _cvv = "313";
  @override
  Widget build(BuildContext context) {
    return CreditCard(
      bankName: _bankname,
      cardNumber: _cardnumber,
      cardExpiry: _cardexpiry,
      cardHolderName: _holdername,
      cvv: _cvv,
      textExpDate: _textExpDate,
      cardType: CardType.visa,
      showBackSide: _showbackside,
      frontBackground: CardBackgrounds.black,
      backBackground: CardBackgrounds.white,
      showShadow: true,
      backTextColor: Colors.teal,
      frontTextColor: Colors.amber,
    );
  }
}

Widget a1 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton.icon(
    onPressed: () {
      Get.to(() => const AccountPage());
    },
    icon: const Icon(Icons.remove_red_eye),
    label: const Text("كشف الحساب"),
    style: ElevatedButton.styleFrom(
      // fixedSize: const Size(150, 100),
      textStyle: CustomTextStyle.f15w,
    ),
  ),
);

Widget a2 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton.icon(
    onPressed: () {
      Get.to(() => const Mapp());
    },
    icon: const Icon(Icons.location_on_outlined),
    label: const Text("أقرب صراف الي"),
    style: ElevatedButton.styleFrom(
      // fixedSize: const Size(150, 100),
      textStyle: CustomTextStyle.f15b,
    ),
  ),
);

Widget a3 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton.icon(
    onPressed: () {},
    icon: const Icon(Icons.qr_code),
    label: const Text("QR اضهار ال"),
    style: ElevatedButton.styleFrom(
      // fixedSize: const Size(150, 100),
      textStyle: CustomTextStyle.f15b,
    ),
  ),
);

Widget a4 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton.icon(
    onPressed: () {
      Get.to(() => const Store());
    },
    icon: const Icon(Icons.notification_important),
    label: const Text("الاشعارات"),
    style: ElevatedButton.styleFrom(
      // fixedSize: const Size(150, 100),
      textStyle: CustomTextStyle.f15b,
    ),
  ),
);
