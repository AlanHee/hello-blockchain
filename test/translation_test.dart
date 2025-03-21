import 'package:hello_blockchain/translation.dart';
import 'package:test/test.dart';

void main() {
  test('translation', () {
    Translation tx = Translation('address1', 'address2', 100);
    expect(tx.id.length, 64);
  });
}
