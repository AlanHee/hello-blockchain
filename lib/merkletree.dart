import 'package:crypto/crypto.dart';
import 'dart:convert';

class MerkleTree {
  final List<String> _hashs;
  List<String> _tree = [];
  MerkleTree(this._hashs) {
    _tree = _buildTree(_hashs);
  }
  bool contains(String leaves) {
    return _tree.contains(leaves);
  }

  List<String> _buildTree(List<String> leaves) {
    if (leaves.isEmpty) return [];

    List<String> tree = [];
    List<String> currentLevel = List.from(leaves);
    tree.addAll(currentLevel);

    while (currentLevel.length > 1) {
      List<String> nextLevel = [];

      for (int i = 0; i < currentLevel.length; i += 2) {
        String left = currentLevel[i];
        // 处理奇数节点情况
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
}
