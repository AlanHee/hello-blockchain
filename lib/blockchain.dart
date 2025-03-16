import 'package:hello_blockchain/block.dart';

class BlockChain {
  List<Block> chain = [];
  int diffculty = 1;

  BlockChain() {
    chain = [_createGenesisBlock()];
  }

  _createGenesisBlock() {
    return Block(0, DateTime.now(), '0', 'this is genesis data');
  }

  addBlock(String data) {
    Block last = chain.last;
    Block block = Block(last.id + 1, DateTime.now(), last.hash, data);
    block.mineBlock(diffculty);
    chain.add(block);
  }
}
