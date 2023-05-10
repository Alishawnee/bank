import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'view_image_storage.dart';

class QU {
  final String qr;
  final String name;
  QU({required this.qr, required this.name});
}

class Res extends StatefulWidget {
  const Res({super.key});

  @override
  State<Res> createState() => _ResState();
}

class _ResState extends State<Res> {
  @override
  void initState() {
    getQrs();
    super.initState();
  }

  bool lod = true;
  List<QU> qrs = [];
  getQrs() async {
    qrs = [];

    var check = await FirebaseFirestore.instance
        .collection('users')
        .where('userid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .limit(1)
        .get();

    if (check.docs.length == 1) {
      var data = await FirebaseFirestore.instance
          .collection('users')
          .doc(check.docs[0].id)
          .collection('qr')
          .get();
      for (var i in data.docs) {
        qrs.add(QU(qr: i.data()['qr'], name: i.data()['sender']));
      }
    }

    setState(() {
      lod = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: lod
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: qrs.length,
              itemBuilder: (c, i) => ListTile(
                    title: Text('new image'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Vimg(
                                    img: qrs[i].qr,
                                  )));
                    },
                  )),
    );
  }
}
