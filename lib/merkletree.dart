import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:hello_blockchain/merkleproof.dart';

class MerkleTree {
  List<List<String>> _treeLevels = [];
  String get root {
    return _treeLevels.isNotEmpty ? _treeLevels.last.first : '0';
  }

  MerkleTree(List<String> leaves) {
    _treeLevels = _buildTreeLevels(leaves);
  }

  List<List<String>> _buildTreeLevels(List<String> leaves) {
    List<List<String>> levels = [];
    if (leaves.isEmpty) return levels;

    List<String> currentLevel = List.from(leaves);
    levels.add(currentLevel);

    while (currentLevel.length > 1) {
      List<String> nextLevel = [];

      for (int i = 0; i < currentLevel.length; i += 2) {
        String left = currentLevel[i];
        String right =
            (i + 1 < currentLevel.length) ? currentLevel[i + 1] : left;
        nextLevel.add(_hashPair(left, right));
      }

      levels.add(nextLevel);
      currentLevel = nextLevel;
    }

    return levels;
  }

  String _hashPair(String left, String right) {
    return sha256.convert(utf8.encode(left + right)).toString();
  }

  MerkleProof genProof(String targetHash) {
    List<String> proofHashes = [];
    List<bool> directions = [];

    int currentIndex = _treeLevels.first.indexOf(targetHash);
    if (currentIndex == -1) throw Exception('Hash not found');

    // 从最底层开始向上追溯
    for (int level = 0; level < _treeLevels.length - 1; level++) {
      List<String> currentLevel = _treeLevels[level];

      // 判断当前节点的位置
      bool isLeft = currentIndex % 2 == 0;
      int siblingIndex = isLeft ? currentIndex + 1 : currentIndex - 1;

      // 处理奇数层级最后一个节点的情况
      if (siblingIndex >= currentLevel.length) {
        siblingIndex = currentIndex;
      }

      directions.add(!isLeft); // 方向参数：true=需要放在右侧
      proofHashes.add(currentLevel[siblingIndex]);

      // 向上层移动
      currentIndex ~/= 2; // 计算父节点位置
    }

    return MerkleProof(proofHashes, directions);
  }
}
