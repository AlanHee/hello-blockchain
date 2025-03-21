import 'package:hello_blockchain/block.dart';
import 'package:hello_blockchain/translation.dart';
import 'package:test/test.dart';

void main() {
  test('test sha256', () {
    Translation tx = Translation('address1', 'address2', 100.0);
    Block block = Block(0, DateTime.now(), '0', [tx]);
    expect(block.hash.length, 64);
  });
  test('test nonce', () {
    Translation tx = Translation('address1', 'address2', 100.0);
    Block block = Block(0, DateTime.now(), '0', [tx]);
    var preHash = block.hash;
    block.mineBlock(2);
    expect(preHash == block.hash, isFalse);
  });
}
