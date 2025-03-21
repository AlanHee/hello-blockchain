import 'package:hello_blockchain/blockchain.dart';
import 'package:hello_blockchain/translation.dart';
import 'package:test/test.dart';

void main() {
  test('test blockchain', () {
    BlockChain blockchain = BlockChain();
    Translation tx = Translation('address1', 'address2', 100);
    blockchain.addBlock([tx]);
    expect(blockchain.chain.length, 2);
  });
}
