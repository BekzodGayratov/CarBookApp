import 'dart:math';

Map<String, String> paymentDatas = {
  "cardNumber": "",
  "cardExperity": "",
  "cardHolder": "",
  "cvv": ""
};

List<int> randomPaymentCode = List.generate(4, (index) => Random().nextInt(9));
String inputPayCode = "";
String sum = "";

