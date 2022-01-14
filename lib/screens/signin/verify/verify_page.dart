import 'package:app/screens/signin/verify/verify_log.dart';
import 'package:flutter/material.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final _firstKey = GlobalKey<FormFieldState>();
  final _secondKey = GlobalKey<FormFieldState>();
  final _thirdKey = GlobalKey<FormFieldState>();
  final _fourKey = GlobalKey<FormFieldState>();
  late List<GlobalKey> _keys = [_firstKey, _secondKey, _thirdKey, _fourKey];

  final _first = TextEditingController();
  final _second = TextEditingController();
  final _third = TextEditingController();
  final _fourth = TextEditingController();
  late List<TextEditingController> _controllers = [
    _first,
    _second,
    _third,
    _fourth
  ];
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) => sendCode());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          child: Row(
            children: const [
              Icon(
                Icons.chevron_left,
                color: Colors.black,
              ),
              Text(
                "Back",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.16,
                  ),
                  child: const Text(
                    "Enter varifacation code",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.05,
                    left: MediaQuery.of(context).size.width * 0.25,
                    right: MediaQuery.of(context).size.width * 0.21,
                  ),
                  child: const Text(
                    "Enter OPT code send to your phone mobile number",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 0.205,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: TextFormField(
                              key: _keys[index],
                              controller: _controllers[index],
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                              validator: (v) {
                                if (v!.isEmpty) {
                                  return "Xatolik!!!";
                                }
                              },
                            ),
                          ),
                        );
                      },
                      itemCount: 4,
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 30.0),
                      child: Text(
                        "We will send sms your phone number",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.01,
                          left: MediaQuery.of(context).size.width * 0.05),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                        width: MediaQuery.of(context).size.width * 0.20,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.amber),
                          child: const Text(
                            "Send again",
                            style:
                                TextStyle(color: Colors.black, fontSize: 9.0),
                          ),
                          onPressed: () {
                            setState(() {
                              verifyCodes;
                              sendCode();
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: OutlinedButton(
                    child: const Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    onPressed: () {
                      // TO DO validate valid varifaction code to List;
                      if (_firstKey.currentState!.validate() &&
                          _secondKey.currentState!.validate() &&
                          _thirdKey.currentState!.validate() &&
                          _fourKey.currentState!.validate()) {
                        verifyCodes.add(_first.text);
                        verifyCodes.add(_second.text);
                        verifyCodes.add(_third.text);
                        verifyCodes.add(_fourth.text);
                        if (randomCodes[0] == int.parse(_first.text) &&
                            randomCodes[1] == int.parse(_second.text) &&
                            randomCodes[2] == int.parse(_third.text) &&
                            randomCodes[3] == int.parse(_fourth.text)) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text("You signed in successfuly !!!"),
                              );
                            },
                          );
                          Future.delayed(const Duration(seconds: 3)).then(
                              (value) => Navigator.pushNamed(context, '/home'));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                title: Text("Wrong code !!!"),
                              );
                            },
                          );
                        }
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  sendCode() {
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
                "${randomCodes[0]}",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${randomCodes[1]}",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${randomCodes[2]}",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              Text(
                "${randomCodes[3]}",
                style: const TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
