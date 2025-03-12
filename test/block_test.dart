import 'package:hello_blockchain/block.dart';
import 'package:test/test.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() {
  test('test hash256 func', () {
    int id = 0;
    DateTime timestamp = DateTime.now();
    String preHash = '0';
    String merkleRoot = '0';
    Block block = Block(id, timestamp, 'data', preHash, merkleRoot);
    String hash =
        sha256
            .convert(utf8.encode('$id+$timestamp+$preHash+$merkleRoot'))
            .toString();
    expect(block.hash, hash);
  });
}
