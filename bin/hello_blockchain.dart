import 'package:hello_blockchain/block_chain.dart';

void main(List<String> arguments) {
  BlockChain blockChain = BlockChain();
  blockChain.addBlock('1 block data');
  blockChain.addBlock('2 block data');
  blockChain.addBlock('3 block data');

  blockChain.blockChain.forEach((block) {
    print('''
index: ${block.index}
data: ${block.data}
prehash: ${block.previousHash}
hash: ${block.hash}
nonce: ${block.nonce}
---------------------------
''');
  });
}
