import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Send extends StatefulWidget {
  Send({super.key});

  @override
  State<Send> createState() => _SendState();
}

class _SendState extends State<Send> {
  final emailController = TextEditingController();

  String? idR;

  String? toR;

  File? img;

  getIdUser() async {
    idR = null;
    var check = await FirebaseFirestore.instance
        .collection('users')
        .where('Email', isEqualTo: emailController.text.trim())
        .limit(1)
        .get();

    if (check.docs.length == 1) {
      idR = check.docs[0].id;
      toR = check.docs[0].data()['token'];
    } else {
      Fluttertoast.showToast(msg: "no found user");
    }
  }

  getImg() async {
    img = null;
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    img = image != null ? File(image.path) : null;
  }

  bool lod = false;

  sendImage() async {
    try {
      await getIdUser();
      if (idR != null && img != null) {
        setState(() {
          lod = true;
        });
        Reference storageRef = FirebaseStorage.instance
            .ref()
            .child("images/${DateTime.now().millisecondsSinceEpoch}.jpg");

        await storageRef.putFile(img!);
        String downloadURL = await storageRef.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(idR!)
            .collection('qr')
            .add({
          "qr": downloadURL,
          "sender": FirebaseAuth.instance.currentUser!.uid
        });
        if (toR != null) {
          se('Hellow ', 'new qr', toR!);
        }

        setState(() {
          lod = false;
        });
        Fluttertoast.showToast(msg: "success send image ");
      }

      idR = null;
      img = null;
      toR = null;
      emailController.text = '';
    } catch (e) {
      setState(() {
        lod = false;
      });
      idR = null;
      img = null;
      toR = null;
      emailController.text = '';
      Fluttertoast.showToast(msg: "error send image ");
    }
  }

  void se(String ti, String b, String t) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'key=AAAA1kxiTjY:APA91bFsRjgKY4uCgYGtAAYUr1SsQQx4SxmU9LYCAY6FdOohCkR3Rh4Nr3-4AK4eE1Mv4i1gR9l7vZEhGSqiIUvg5O-judOJRfejYKYrlrOp9LfsQvSEZz0gSGCCHn664TdsCapxKYab',
        },
        body: json.encode(
          {
            "notification": {"body": b, "title": ti, "sound": "default"},
            "data": {"score": "5x1", "time": "15:10"},
            "to": t,
          },
        ),
      );
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: emailController,
              ),
              ElevatedButton(
                  onPressed: () {
                    getImg();
                  },
                  child: const Text('select image')),
              ElevatedButton(
                  onPressed: () async {
                    sendImage();
                  },
                  child: lod
                      ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                      : const Text('send')),
            ],
          ),
        ),
      ),
    );
  }
}
