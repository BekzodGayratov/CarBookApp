import 'package:app/screens/payment/payment_datas.dart';
import 'package:flutter/material.dart';

class PaymentVerify extends StatefulWidget {
  const PaymentVerify({Key? key}) : super(key: key);

  @override
  _PaymentVerifyState createState() => _PaymentVerifyState();
}

class _PaymentVerifyState extends State<PaymentVerify> {
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormFieldState>();
  @override
  void initState() {
    setState(() {
      Future.delayed(Duration(seconds: 2)).then((value) => sendCodePay());
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Payment Method",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.03),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.04),
              child: const Text(
                "Please enter the code sent to you",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            TextFormField(
              key: _formKey,
              controller: _codeController,
              decoration: InputDecoration(
                  hintText: "Enter sms number",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0))),
              validator: (v) {
                if (v!.isEmpty) {
                  return "Bo'sh kiritish mumkin emas";
                }
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.52,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                child: const Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    inputPayCode = _codeController.text;
                  }
                  ok();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  sendCodePay() {
    //TO DO send verification code to this page from //verify_log.dart file
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Verification code sent"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "${randomPaymentCode[0]}",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${randomPaymentCode[1]}",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${randomPaymentCode[2]}",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${randomPaymentCode[3]}",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }

  ok() {
    for (var item in randomPaymentCode) {
      sum += item.toString();
    }
    if (int.parse(sum) == int.parse(inputPayCode)) {
      Navigator.pushNamed(context, "/mycart");
    }
  }
}
