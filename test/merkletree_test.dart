import 'package:crypto/crypto.dart';
import 'package:hello_blockchain/merkleproof.dart';
import 'package:hello_blockchain/merkletree.dart';
import 'dart:convert';
import 'package:test/test.dart';

void main() {
  test('test merkletree', () {
    List<String> txs = ['a', 'b', 'c', 'd', 'e'];
    var hashs =
        txs.map((e) => sha256.convert(utf8.encode(e)).toString()).toList();
    MerkleTree merkletree = MerkleTree(hashs);
    final rootHash = merkletree.root;
    for (var targetHash in hashs) {
      MerkleProof merkleproof = merkletree.genProof(targetHash);
      var result = merkleproof.verify(targetHash, rootHash);
      expect(result, isTrue);
      expect(merkleproof.verify('mod hash', rootHash), isFalse);
    }
  });
}
