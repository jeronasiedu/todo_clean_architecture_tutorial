import 'dart:math';

String generateRandomId(int length) {
  final random = Random();
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final id = StringBuffer();

  for (var i = 0; i < length; i++) {
    id.write(chars[random.nextInt(chars.length)]);
  }

  return id.toString();
}
