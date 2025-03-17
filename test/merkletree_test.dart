import 'package:crypto/crypto.dart';
import 'package:hello_blockchain/merkletree.dart';
import 'dart:convert';
import 'package:test/test.dart';

void main() {
  test('test merkletree', () {
    List<String> txs = ['a', 'b', 'c', 'd', 'e'];
    var hashs =
        txs.map((e) => sha256.convert(utf8.encode(e)).toString()).toList();
    MerkleTree merkletree = MerkleTree(hashs);
    for (var leaves in hashs) {
      expect(merkletree.contains(leaves), isTrue);
    }
  });
}
