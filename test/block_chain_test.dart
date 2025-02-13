import 'package:hello_blockchain/block_chain.dart';
import 'package:test/test.dart';

void main() {
  test('BlockChain', () {
    final blockChain = BlockChain();
    blockChain.addBlock([]);
    expect(blockChain.blockChain.first.previousHash, '0');
    expect(blockChain.blockChain.length, 2);
  });
}
