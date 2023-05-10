import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:iraq_bank/controller/ecc.dart';

const _permissions = [Permissions.READ_EXTERNAL_STORAGE, Permissions.CAMERA];

const _permissionGroup = [PermissionGroup.Camera, PermissionGroup.Photos];

class BarcodeScaning extends StatefulWidget {
  const BarcodeScaning({super.key});

  @override
  _BarcodeScaningState createState() => _BarcodeScaningState();
}

class _BarcodeScaningState extends State<BarcodeScaning> {
  late FlutterScankit scanKit;

  String email = "";
  String account = "";

  @override
  void initState() {
    super.initState();
    scanKit = FlutterScankit();
    scanKit.addResultListen((val) {
      var list = val.split(' ');
      String l1 = list[0];
      String l2 = list[1].replaceAll(',', '');

      setState(() {
        email = Ecc().decryption(l1);
        account = Ecc().decryption(l2);
      });
    });
  }

  @override
  void dispose() {
    scanKit.dispose();
    super.dispose();
  }

  Future<void> startScan() async {
    try {
      await scanKit.startScan(scanTypes: [ScanTypes.ALL]);
    } on PlatformException {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Center(
                child: Text(
              'Data:',
              style: TextStyle(fontSize: 30),
            )),
            Text(email),
            Text(account),
            const SizedBox(
              height: 32,
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              child: const Text("Scan code"),
              onPressed: () async {
                if (!await FlutterEasyPermission.has(perms: _permissions, permsGroup: _permissionGroup)) {
                  FlutterEasyPermission.request(perms: _permissions, permsGroup: _permissionGroup);
                } else {
                  startScan();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
