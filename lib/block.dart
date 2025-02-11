import 'dart:convert';
import 'package:crypto/crypto.dart' show sha256;

class Block {
  final int index;
  final DateTime timestamp;
  final String data;
  final String previousHash;
  String hash = "";
  int nonce = 0;

  Block(this.index, this.timestamp, this.data, this.previousHash) {
    hash = caculateHash();
  }

  String caculateHash() {
    return sha256
        .convert(utf8.encode('$index$timestamp$data$previousHash$nonce'))
        .toString();
  }

  mindBlock(int difficulty) {
    //!TODO PoW
    if (!hash.startsWith('0' * difficulty)) {
      nonce++;
      hash = caculateHash();
    }
  }
}
