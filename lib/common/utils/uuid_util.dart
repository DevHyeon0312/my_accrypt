import 'dart:math';
import 'dart:typed_data';

class UuidUtil {
  static String generateV7() {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final random = Random.secure();
    final bytes = Uint8List(16);

    // Timestamp (48 bits -> 6 bytes)
    bytes[0] = (timestamp >> 40) & 0xFF;
    bytes[1] = (timestamp >> 32) & 0xFF;
    bytes[2] = (timestamp >> 24) & 0xFF;
    bytes[3] = (timestamp >> 16) & 0xFF;
    bytes[4] = (timestamp >> 8) & 0xFF;
    bytes[5] = timestamp & 0xFF;

    // version 7 -> 0111
    bytes[6] = (random.nextInt(256) & 0x0F) | 0x70;

    // variant -> 10xx xxxx
    bytes[8] = (random.nextInt(256) & 0x3F) | 0x80;

    // Random bits
    for (int i = 7; i < 16; i++) {
      if (i == 8) continue; // 이미 variant 설정함
      bytes[i] = random.nextInt(256);
    }

    return _formatUuid(bytes);
  }

  static String _formatUuid(Uint8List bytes) {
    String toHex(int byte) => byte.toRadixString(16).padLeft(2, '0');
    return '${toHex(bytes[0])}${toHex(bytes[1])}${toHex(bytes[2])}${toHex(bytes[3])}-'
        '${toHex(bytes[4])}${toHex(bytes[5])}-'
        '${toHex(bytes[6])}${toHex(bytes[7])}-'
        '${toHex(bytes[8])}${toHex(bytes[9])}-'
        '${toHex(bytes[10])}${toHex(bytes[11])}${toHex(bytes[12])}${toHex(bytes[13])}${toHex(bytes[14])}${toHex(bytes[15])}';

  }
}