import 'dart:convert';

import 'package:crypto/crypto.dart';

class MerkleProof {
  final List<String> hashes;
  final List<bool> directions; // 左false/右true

  MerkleProof(this.hashes, this.directions);

  bool verify(String targetHash, String rootHash) {
    String current = targetHash;
    for (int i = 0; i < hashes.length; i++) {
      current =
          directions[i]
              ? sha256.convert(utf8.encode(hashes[i] + current)).toString()
              : sha256.convert(utf8.encode(current + hashes[i])).toString();
    }
    return current == rootHash;
  }
}
