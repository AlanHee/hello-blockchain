import 'dart:convert';
import 'package:crypto/crypto.dart';

class Block {
  final int id;
  final DateTime timestamp;
  final String data;
  final String merkleRoot;
  final String preHash;
  String hash = '0';

  Block(this.id, this.timestamp, this.data, this.preHash, this.merkleRoot) {
    hash = calculateHash();
  }

  String calculateHash() {
    return sha256
        .convert(utf8.encode('$id+$timestamp+$preHash+$merkleRoot'))
        .toString();
  }

  @override
  String toString() {
    return '''
block: $id
created: $timestamp
hash: $hash
previoushash: $preHash
merkleroot: $merkleRoot
''';
  }
}
