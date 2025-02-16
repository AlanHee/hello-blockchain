import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:hello_blockchain/rsa.dart';
import 'package:test/test.dart';

void main() {
  test('RSA class', () {
    final (privateKey, publicKey) = RSA.create();
    final msg = Uint8List.fromList('this is message'.codeUnits);
    final hash = sha256.convert(msg).bytes;
    final (sigr, sigs) = RSA.sign(Uint8List.fromList(hash), privateKey!);
    expect(RSA.verify(Uint8List.fromList(hash), sigr, sigs, publicKey), true);
  });
}
