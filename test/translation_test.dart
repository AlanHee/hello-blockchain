import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:hello_blockchain/translation.dart';
import 'package:test/test.dart';

void main() {
  test('Translation class', () {
    final from = 'address 1';
    final to = 'address 2';
    final amount = 100.0;
    final tx = Translation(from, to, amount);
    final hash = sha256.convert(utf8.encode('$from$to$amount')).toString();
    expect(hash, tx.hash);
  });
}
