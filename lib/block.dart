import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'merkletree.dart';
import 'translation.dart';

class Block {
  final int index;
  final DateTime timestamp;
  final List<Translation> translations;
  final String previousHash;
  final String merkleRoot;
  String hash = '';
  int nonce = 0;

  Block(this.index, this.timestamp, this.translations, this.previousHash)
      : merkleRoot = Merkletree(translations).root {
    hash = caculateHash();
  }

  String caculateHash() {
    return sha256
        .convert(utf8.encode('$index$timestamp$merkleRoot$previousHash$nonce'))
        .toString();
  }

  // PoW
  mindBlock(int difficulty) {
    final target = '0' * difficulty;
    if (!hash.startsWith(target)) {
      nonce++;
      hash = caculateHash();
    }
  }

  @override
  String toString() {
    return '''
Block $index
prev: $previousHash
hash: $hash
merkle: $merkleRoot
txCount: ${translations.length}
nonce: $nonce 
''';
  }
}
