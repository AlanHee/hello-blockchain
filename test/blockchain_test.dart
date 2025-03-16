import 'package:hello_blockchain/blockchain.dart';
import 'package:test/test.dart';

void main() {
  test('test blockchain', () {
    BlockChain blockchain = BlockChain();
    blockchain.addBlock('this is data');
    expect(blockchain.chain.length, 2);
  });
}
