import 'package:hello_blockchain/block_chain.dart';
import 'package:hello_blockchain/merkletree.dart';
import 'package:hello_blockchain/translation.dart';

void main(List<String> arguments) {
  BlockChain blockChain = BlockChain();
  List<Translation> translations = [
    Translation('address 3 ', 'address 4', 100),
    Translation('address 4 ', 'address 5', 100),
    Translation('address 5 ', 'address 6', 100),
  ];
  blockChain.addBlock(translations);

  blockChain.blockChain.forEach(print);

  //proof
  final lastBlock = blockChain.blockChain.last;
  final merkletree = Merkletree(lastBlock.translations);
  translations.forEach((tx) {
    print('tx[${tx.hash}] existed is: ${merkletree.contains(tx.hash)}');
  });
  print('merkle root if the same: ${lastBlock.merkleRoot == merkletree.root}');
}
