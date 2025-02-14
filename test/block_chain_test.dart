import 'package:hello_blockchain/block_chain.dart';
import 'package:test/test.dart';

void main() {
  test('BlockChain', () {
    final blockChain = BlockChain();
    blockChain.addBlock([]);
    final geniesisBlock = blockChain.blockChain.first;
    final block2 = blockChain.blockChain[1];
    expect(geniesisBlock.hash, block2.previousHash);
  });
}
