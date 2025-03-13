import 'package:hello_blockchain/block.dart';

void main(List<String> arguments) {
  Block block = Block(0, DateTime.now(), '0', 'this is data');
  print(block);
}
