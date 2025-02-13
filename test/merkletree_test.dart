import 'package:hello_blockchain/merkletree.dart';
import 'package:hello_blockchain/translation.dart';
import 'package:test/test.dart';

void main() {
  test('MerkleTree', () {
    final List<Translation> trans = [
      Translation('address 1', 'address 2', 100.0),
      Translation('address 2', 'address 3', 100.0),
    ];
    final merkletree = Merkletree(trans);
    trans.map((trans) {
      expect(merkletree.contains(trans.hash), true);
    });
  });
}
