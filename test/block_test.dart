import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:hello_blockchain/block.dart';
import 'package:test/test.dart';

void main() {
  test('Block class', () {
    final index = 0;
    final timestamp = DateTime.now();
    final merkleRoot = '0';
    final previousHash = '0';
    final nonce = 0;

    final block = Block(index, timestamp, [], previousHash);
    final hash = sha256
        .convert(utf8.encode('$index$timestamp$merkleRoot$previousHash$nonce'))
        .toString();

    expect(block.hash, hash);
  });
}
