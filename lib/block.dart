import 'package:crypto/crypto.dart';
import 'dart:convert';

class Block {
  final int id;
  final DateTime timestamp;
  final String preHash;
  final String data;
  String hash = '';

  Block(this.id, this.timestamp, this.preHash, this.data) {
    hash = _cucalateHash();
  }

  String _cucalateHash() {
    return sha256.convert(utf8.encode('$id+$timestamp+$preHash')).toString();
  }

  @override
  String toString() {
    return """
Block index: $id
created: $timestamp
hash: $hash
previous hash: $preHash
""";
  }
}
