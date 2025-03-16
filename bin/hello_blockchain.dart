import 'package:hello_blockchain/blockchain.dart';

void main(List<String> arguments) {
  BlockChain blockchain = BlockChain();
  blockchain.addBlock('this is data 1');
  blockchain.addBlock('this is data 2');
  blockchain.chain.forEach(print);
}
