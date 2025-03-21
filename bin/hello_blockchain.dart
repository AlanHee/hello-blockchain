import 'package:hello_blockchain/blockchain.dart';
import 'package:hello_blockchain/merkleproof.dart';
import 'package:hello_blockchain/merkletree.dart';
import 'package:hello_blockchain/translation.dart';

void main(List<String> arguments) {
  BlockChain blockchain = BlockChain();

  Translation tx1 = Translation('address1', 'address2', 100.0);
  Translation tx2 = Translation('address3', 'address4', 100.0);
  Translation tx3 = Translation('address5', 'address6', 100.0);
  Translation tx4 = Translation('address7', 'address8', 100.0);
  Translation tx5 = Translation('address9', 'address10', 100.0);
  Translation tx6 = Translation('address11', 'address12', 100.0);
  blockchain.addBlock([tx1, tx2, tx3]);
  blockchain.addBlock([tx4, tx5, tx6]);
  blockchain.chain.forEach(print);

  final targetHash = tx6.id;
  final rootHash = blockchain.chain.last.merkleRoot;
  MerkleTree merkletree = MerkleTree([tx4, tx5, tx6].map((e) => e.id).toList());
  MerkleProof merkleProof = merkletree.genProof(targetHash);
  final result = merkleProof.verify(targetHash, rootHash);
  print('Tx${tx6.id} verify: + $result');
}
