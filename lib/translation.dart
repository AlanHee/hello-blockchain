import 'dart:convert';

import 'package:crypto/crypto.dart';

class Translation {
  final String from;
  final String to;
  final double amount;

  Translation(this.from, this.to, this.amount);

  String get id {
    return sha256.convert(utf8.encode('$from+$to+$amount')).toString();
  }
}
