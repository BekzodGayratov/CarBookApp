import 'package:app/screens/payment/payment_datas.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardController = TextEditingController();
  final _experityController = TextEditingController();
  final _holderController = TextEditingController();
  final _cvvController = TextEditingController();
  @override
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Payment",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: _cardController,
                      decoration: InputDecoration(
                          hintText: "Card number",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Bo'sh kiritish mumkin emas";
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextFormField(
                      controller: _experityController,
                      decoration: InputDecoration(
                          hintText: "Card experity date",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Bo'sh kiritish mumkin emas";
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextFormField(
                      controller: _holderController,
                      decoration: InputDecoration(
                          hintText: "Card holder name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Bo'sh kiritish mumkin emas";
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    TextFormField(
                      controller: _cvvController,
                      decoration: InputDecoration(
                          hintText: "CVV",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "Bo'sh kiritish mumkin emas";
                        }
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                  ],
                ),
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
                      paymentDatas['cardNumber'] = _cardController.text;
                      paymentDatas['cardExperity'] = _experityController.text;
                      paymentDatas['cardHolder'] = _holderController.text;
                      paymentDatas['cvv'] = _cvvController.text;
                      Navigator.pushNamed(context, '/paymentverify');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
