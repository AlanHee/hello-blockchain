import 'translation.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

class Merkletree {
  List<String> _hashes = [];
  String root = '';

  Merkletree(List<Translation> translatioins) {
    final leaves = translatioins.map((tx) => tx.hash).toList();
    _hashes = _buildTree(leaves);
    root = _hashes.isNotEmpty ? _hashes.last : '0';
  }

  List<String> _buildTree(leaves) {
    if (leaves.isEmpty) return [];

    List<String> tree = [];
    List<String> currentLevel = List.from(leaves);
    tree.addAll(currentLevel);

    while (currentLevel.length > 1) {
      List<String> nextLevel = [];

      for (int i = 0; i < currentLevel.length; i += 2) {
        String left = currentLevel[i];
        // process odd number
        String right =
            (i + 1 < currentLevel.length) ? currentLevel[i + 1] : left;
        String combined = sha256.convert(utf8.encode(left + right)).toString();
        nextLevel.add(combined);
      }

      tree.addAll(nextLevel);
      currentLevel = nextLevel;
    }

    return tree;
  }

  // proof
  bool contains(String hash) {
    return _hashes.contains(hash);
  }
}
