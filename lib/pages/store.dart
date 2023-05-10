// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'dart:math';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
  //----------------------------------------------------
  late File file;
  var imagepicker = ImagePicker();
  uploadfromCamera() async {
    var camera = await imagepicker.getImage(source: ImageSource.camera);

    if (imagepicker != null) {
      file = File(camera!.path);
      var nameimage = basename(camera.path);
      // ++++++++++++++++++++++++++++++++++++++ // upload image to firbase
      var refstorage = FirebaseStorage.instance.ref(nameimage);
      await refstorage.putFile(file);
      var url = await refstorage.getDownloadURL();

      print(url);
      print("===============================");

      //+++++++++++++++++++++++++++
    } else {
      print("Error");
    }
  }

  //-----------------------------------------------------------------
  uploadfromPhotos() async {
    var camera = await imagepicker.getImage(source: ImageSource.gallery);

    if (imagepicker != null) {
      file = File(camera!.path);
      var nameimage = basename(camera.path);
      // ++++++++++++++++++++++++++++++++++++++ // upload image to firbase

      var random = Random().nextInt(1000000);
      nameimage = "$random $nameimage";
      // print("++++++++++++++++++");
      // print(nameimage);

      var refstorage = FirebaseStorage.instance.ref(nameimage);

      await refstorage.putFile(file);

      var url = await refstorage.getDownloadURL();
      // print("===============================");

      // print(url);
      // print("===============================");

      //+++++++++++++++++++++++++++
    } else {
      // print("Error");
    }
  }

  //-------------------------------------------------
  getImagesName() async {
    var ref = await FirebaseStorage.instance.ref().list();

    for (var element in ref.items) {
      print(element.name);
    }
  }

  @override
  void initState() {
    getImagesName();
    super.initState();
  }

  //--------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Page"),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await uploadfromCamera();
                  },
                  child: const Icon(Icons.camera_alt)),
              ElevatedButton(
                  onPressed: () async {
                    await uploadfromPhotos();
                  },
                  child: const Icon(Icons.photo_camera_back)),
            ],
          ),
        ));
  }
}
