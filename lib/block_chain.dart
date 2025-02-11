import 'block.dart';

class BlockChain {
  List<Block> blockChain = [];
  int diffculty = 2;

  BlockChain() {
    blockChain = [createGenesisBlock()];
  }

  createGenesisBlock() {
    return Block(0, DateTime.now(), 'Genesis Block', '0');
  }

  void addBlock(String data) {
    Block lastBlock = blockChain.last;
    Block newBlock =
        Block(lastBlock.index + 1, DateTime.now(), data, lastBlock.hash);
    newBlock.mindBlock(diffculty);
    blockChain.add(newBlock);
  }
}
