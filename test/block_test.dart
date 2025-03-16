import 'package:hello_blockchain/block.dart';
import 'package:test/test.dart';

void main() {
  test('test sha256', () {
    Block block = Block(0, DateTime.now(), '0', 'this is data');
    expect(block.hash.length, 64);
  });
  test('test nonce', () {
    Block block = Block(0, DateTime.now(), '0', 'this is data');
    var preHash = block.hash;
    block.mineBlock(2);
    expect(preHash == block.hash, isFalse);
  });
}
