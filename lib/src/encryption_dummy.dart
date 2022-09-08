import 'dart:math';

import 'package:characters/characters.dart';

class EncryptionDummy {
  static var _encryptionKey = "";
  static const _encryptionKeyLen = 128;

  static String encrypt(String str) {
    _genRandomHash();
    if (str.isEmpty) {
      return "";
    }
    String encrypted = "";
    int i = 0;
    int charIndex = 0;

    _encryptionKey.characters.forEach((char) {
      if (i % 2 == 0 && charIndex < str.length && i >= 20) {
        encrypted += str[charIndex];
        charIndex++;
      } else {
        encrypted += char;
      }
      i++;
    });

    // how many characters does the str to encrypt have (e.g Hello has 5)
    var lenStr = str.length;
    // how many characters does the len value have (e.g Hello has 5 characters -> 5 is a single character... 10 has two characters and so on)
    var lenStrLen = str.length.toString().length;

    // remove unneccesary chars to match length to _encryptionKeyLen
    encrypted = encrypted.substring(0, _encryptionKeyLen - (lenStrLen + 1));

    // reverse
    encrypted = encrypted.split('').reversed.join();

    // finally add the information to the string
    encrypted += lenStr.toString().split('').reversed.join();
    encrypted += lenStrLen.toString().split('').reversed.join();

    return encrypted;
  }

  static String decrypt(String encStr) {
    if (encStr.isEmpty) {
      return "";
    }
    var str = encStr.split('').reversed.join();
    var decrypted = "";
    var lenOfLenValue = int.tryParse(str[0])!;
    str = str.substring(1, str.length);
    var lenStr = str.substring(0, lenOfLenValue);
    str = str.substring(lenOfLenValue, str.length);
    int len = int.tryParse(lenStr)!;
    int i = 0;
    int decryptedLen = 0;

    for (final char in str.characters) {
      if (i % 2 == 0 && i >= 20) {
        decrypted += char;
        decryptedLen++;
      }
      i++;
      if (decryptedLen >= len) {
        break;
      }
    }

    return decrypted;
  }

  static void _genRandomHash() {
    const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    Random _rnd = Random();
    _encryptionKey = String.fromCharCodes(Iterable.generate(_encryptionKeyLen, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }
}
