import 'package:crypto/crypto.dart';
import 'dart:convert';

class Block {
  final int id;
  final DateTime timestamp;
  final String preHash;
  final String data;
  String hash = '';
  int nonce = 0;

  Block(this.id, this.timestamp, this.preHash, this.data) {
    hash = _cucalateHash();
  }

  String _cucalateHash() {
    return sha256
        .convert(utf8.encode('$id+$timestamp+$preHash+$nonce'))
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
Hash: $hash
Previous: $preHash
Data: $data
Nonce: $nonce
""";
  }
}
