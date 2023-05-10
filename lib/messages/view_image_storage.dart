import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:photo_view/photo_view.dart';

class Vimg extends StatelessWidget {
  Vimg({super.key, required this.img});
  String img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: PhotoView(
            imageProvider: NetworkImage(img),
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var response = await Dio()
              .get(img, options: Options(responseType: ResponseType.bytes));
          final result = await ImageGallerySaver.saveImage(
            Uint8List.fromList(response.data),
            quality: 60,
          );
          Fluttertoast.showToast(msg: "saved image");
        },
        child: const Text('save'),
      ),
    );
  }
}
