import 'dart:math';
import 'dart:convert';
import 'dart:typed_data';
import 'package:pointycastle/ecc/curves/secp256k1.dart';
import 'package:pointycastle/ecc/api.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/macs/hmac.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/key_generators/ec_key_generator.dart';
import 'package:crypto/crypto.dart';
import 'package:bs58/bs58.dart';

void main() {
  // 1. 生成私钥
  BigInt privateKey = generatePrivateKey();
  print('私钥: 0x${privateKey.toRadixString(16)}');

  // 2. 生成公钥
  ECPoint publicKey = getPublicKey(privateKey);
  String compressedPubKey = compressPublicKey(publicKey);
  print('压缩公钥: $compressedPubKey');

  // 3. 生成地址
  String address = getAddress(compressedPubKey);
  print('地址: $address');
}

// 生成随机私钥
BigInt generatePrivateKey() {
  final random = Random.secure();
  BigInt privateKey;
  final secp256k1 = ECCurve_secp256k1();
  final n = secp256k1.n;

  do {
    privateKey = BigInt.parse(
        List.generate(32, (_) => random.nextInt(256).toRadixString(16)).join(),
        radix: 16);
  } while (privateKey >= n || privateKey == BigInt.zero);

  return privateKey;
}

// 从私钥生成公钥
ECPoint? getPublicKey(BigInt privateKey) {
  final secp256k1 = ECCurve_secp256k1();
  return secp256k1.G * privateKey;
}

// 压缩公钥
String compressPublicKey(ECPoint publicKey) {
  final x = publicKey.x!.toBigInteger();
  final y = publicKey.y!.toBigInteger();
  final header = y.isEven ? '02' : '03';
  return header + x.toRadixString(16).padLeft(64, '0');
}

// 生成地址
String getAddress(String compressedPubKey) {
  // SHA-256哈希
  var sha256 = sha256.convert(hex.decode(compressedPubKey)).bytes;

  // RIPEMD-160哈希
  var ripeHash = ripemd160.convert(sha256).bytes;

  // 添加版本字节 (0x00 表示比特币主网)
  Uint8List versionedPayload = Uint8List.fromList([0x00] + ripeHash);

  // 计算校验和
  var checksum = _doubleSHA256(versionedPayload).sublist(0, 4);

  // Base58编码
  return base58.encode(versionedPayload + checksum);
}
