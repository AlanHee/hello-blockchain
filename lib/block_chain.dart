import 'block.dart';
import 'translation.dart';

class BlockChain {
  List<Block> blockChain = [];
  int diffculty = 2;

  BlockChain() {
    blockChain = [createGenesisBlock()];
  }

  createGenesisBlock() {
    return Block(
        0,
        DateTime.now(),
        [
          Translation('address 1', 'address 2', 100),
          Translation('address 2', 'address 3', 100),
        ],
        '0');
  }

  void addBlock(List<Translation> translations) {
    final Block prevBlock = blockChain.last;
    final Block newBlock = Block(
        prevBlock.index + 1, DateTime.now(), translations, prevBlock.hash);
    newBlock.mindBlock(diffculty);
    blockChain.add(newBlock);
  }
}
