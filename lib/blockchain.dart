import 'package:hello_blockchain/block.dart';
import 'package:hello_blockchain/translation.dart';

class BlockChain {
  List<Block> chain = [];
  int diffculty = 1;

  BlockChain() {
    chain = [_createGenesisBlock()];
  }

  _createGenesisBlock() {
    Translation tx = Translation('address0', 'address0', 100.0);
    return Block(0, DateTime.now(), '0', [tx]);
  }

  addBlock(List<Translation> data) {
    Block last = chain.last;
    Block block = Block(last.id + 1, DateTime.now(), last.hash, data);
    block.mineBlock(diffculty);
    chain.add(block);
  }
}
