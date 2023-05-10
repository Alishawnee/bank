import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iraq_bank/messages/receive.dart';
import 'package:iraq_bank/messages/send.dart';
import 'package:iraq_bank/messages/view_image_storage.dart';

Widget serchfield = TextFormField(
  decoration: InputDecoration(
    fillColor: Colors.white,
    filled: true,
    prefixIcon: const Icon(Icons.search),
    suffixIcon: IconButton(
      icon: const Icon(Icons.clear),
      onPressed: () {},
    ),
    hintText: 'Search...',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
);

Widget b1 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {
      Get.to(() => Send());
    },
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(120, 120),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(height: 10),
        Icon(Icons.monetization_on_outlined, size: 50),
        Text("تحويل اموال"),
      ],
    ),
  ),
);

Widget b2 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {
      Get.to(() => const Res());
    },
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(120, 120),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(height: 10),
        Icon(Icons.currency_exchange_rounded, size: 50),
        Text(
          "استلام اموال ",
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
);

Widget b3 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {
      Get.to(() => Vimg(img: ''));
    },
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(120, 120),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(height: 10),
        Icon(Icons.qr_code_2, size: 50),
        Text(
          "استلام QR مشفر",
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
);

Widget b4 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(120, 120),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 60,
            width: 60,
            child: Image.asset(
              "images/wu.png",
            ),
          ),
        ),
        const Text("ويسترن يونيون"),
      ],
    ),
  ),
);

Widget b5 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(120, 120),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 10),
        Image.asset("images/mc.png"),
        const Text("والت كارد"),
      ],
    ),
  ),
);

Widget b6 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(120, 120),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(height: 10),
        Image.asset("images/visa.png"),
        const Text("فيزا كارد"),
      ],
    ),
  ),
);

Widget b7 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(120, 120),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(height: 10),
        Icon(Icons.add_box_outlined, size: 50),
        Text("شحن الرصيد"),
      ],
    ),
  ),
);

Widget b8 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(120, 120),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(height: 10),
        Icon(Icons.shopping_cart, size: 50),
        Text("بطاقات الكترونية"),
      ],
    ),
  ),
);

Widget b9 = Padding(
  padding: const EdgeInsets.all(8.0),
  child: ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(120, 120),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        SizedBox(height: 10),
        Icon(Icons.add_card_rounded, size: 50),
        Text(
          "تعبئة بواسطة الفيزا او الماستر",
          textAlign: TextAlign.center,
        ),
      ],
    ),
  ),
);
