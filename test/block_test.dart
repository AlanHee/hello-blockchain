import 'package:hello_blockchain/block.dart';
import 'package:test/test.dart';

void main() {
  test('test sha256', () {
    Block block = Block(0, DateTime.now(), '0', 'this is data');
    expect(block.hash.length, 64);
  });
}
