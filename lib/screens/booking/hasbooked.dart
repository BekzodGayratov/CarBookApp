import 'package:flutter/material.dart';

class HasBooked extends StatefulWidget {
  const HasBooked({Key? key}) : super(key: key);

  @override
  _HasBookedState createState() => _HasBookedState();
}

class _HasBookedState extends State<HasBooked> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Column(
              children: [
                Image.network(
                    "https://i.pinimg.com/originals/45/97/70/459770a2983c886f0473e62097c5006a.gif"),
                const Text(
                  "Car has been booked successfully",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.02,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  child: const Text(
                    "Back to home",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
