import 'dart:convert';
import 'dart:io';
import 'package:encrypt/encrypt.dart' as encrypt;
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
// import 'package:pointycastle/asymmetric/api.dart';

class Ecc {
// Encrypt a string
  static const String k = '12345678910111213141516171819202';
  String encryption(String plainText) {
    final key = encrypt.Key.fromUtf8(k);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return base64.encode(encrypted.bytes);
  }

// Decrypt a string
  String decryption(String cipherText) {
    final key = encrypt.Key.fromUtf8(k);
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypt.Encrypted.fromBase64(cipherText);
    final decrypted = encrypter.decrypt(encrypted, iv: iv);
    return decrypted;
  }
}
