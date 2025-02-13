import 'dart:convert';

import 'package:crypto/crypto.dart';

class Translation {
  final String from;
  final String to;
  final double amoute;
  String hash;

  Translation(this.from, this.to, this.amoute)
      : hash = sha256.convert(utf8.encode('$from$to$amoute')).toString();

  @override
  String toString() => 'tx[$hash]: from:$from to:$to';
}
