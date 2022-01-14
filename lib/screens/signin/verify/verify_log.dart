import 'dart:math';

List<String> verifyCodes = []; // TO DO save valid and validated codes

List<int> randomCodes = List.generate(4, (index) => Random().nextInt(10));

resendCode() {
  return randomCodes;
}
