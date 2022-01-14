import 'package:app/screens/home/home_page.dart';
import 'package:flutter/material.dart';

class EnterancePage extends StatefulWidget {
  const EnterancePage({Key? key}) : super(key: key);

  @override
  _EnterancePageState createState() => _EnterancePageState();
}

class _EnterancePageState extends State<EnterancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.2,
                  right: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "EGAR",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 120.0,
                        fontFamily: 'Notoserif',
                        color: Colors.amberAccent,
                        shadows: [
                          Shadow(
                              blurRadius: 10.0,
                              color: Colors.black,
                              offset: Offset(0, -1))
                        ]),
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.005,
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: Colors.black,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.005,
                              width: MediaQuery.of(context).size.width * 0.4,
                              color: Colors.black,
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.005,
                            width: MediaQuery.of(context).size.width * 0.4,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      const Text(
                        "CAR CENTRAL",
                        style: TextStyle(
                            fontSize: 26.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.3,
                bottom: MediaQuery.of(context).size.height * 0.01,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  child: const Text("Sign in"),
                  onPressed: () {
                    Navigator.pushNamed(context, "/phoneNumber",);
                  },
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              child: OutlinedButton(
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.black),
                ),
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.black)),
                onPressed: () {
                  Navigator.pushNamed(context, "/signup");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
