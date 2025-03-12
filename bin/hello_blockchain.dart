import 'package:hello_blockchain/block.dart';

void main(List<String> arguments) {
  Block block = Block(0, DateTime.now(), 'this is txs', '0', '0');
  print(block.toString());
}
