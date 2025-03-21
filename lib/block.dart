import 'package:crypto/crypto.dart';
import 'package:hello_blockchain/merkletree.dart';
import 'dart:convert';

import 'package:hello_blockchain/translation.dart';

class Block {
  final int id;
  final DateTime timestamp;
  final String preHash;
  final List<Translation> data;
  final String merkleRoot;
  String hash = '';
  int nonce = 0;

  Block(this.id, this.timestamp, this.preHash, this.data)
    : merkleRoot = MerkleTree(data.map((e) => e.id).toList()).root {
    hash = _cucalateHash();
  }

  String _cucalateHash() {
    return sha256
        .convert(utf8.encode('$id+$timestamp+$merkleRoot+$preHash+$nonce'))
        .toString();
  }

  void mineBlock(int diffculty) {
    /// PoW
    while (!hash.startsWith('0' * diffculty)) {
      nonce++;
      hash = _cucalateHash();
    }
  }

  @override
  String toString() {
    return """
Index: $id
Created: $timestamp
MerkleRoot: $merkleRoot
Hash: $hash
Previous: $preHash
Tx.Count: ${data.length}
Nonce: $nonce
""";
  }
}
