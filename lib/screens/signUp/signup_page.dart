import 'package:app/screens/signUp/signup_datas.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  @override
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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.06,
                  bottom: MediaQuery.of(context).size.height * 0.05,
                ),
                child: const Text(
                  "Create account",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            hintText: "Full name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Bo'sh kiritish mumkin emas";
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                            hintText: "Phone number",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0))),
                        validator: (v) {
                          if (v!.isEmpty) {
                            return "Bo'sh kiritish mumkin emas";
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.95,
                child: OutlinedButton(
                  child: const Text(
                    "Create account",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0))),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      names.add(_nameController.text);
                      phoneNumber.add(_phoneController.text);
                    }
                    createAccount();
                    Future.delayed(const Duration(seconds: 1))
                        .then((value) => Navigator.pushNamed(context, "/home"));
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04,
                ),
                child: Row(
                  children: const [
                    Text(
                      "__________________________",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(" or ",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold)),
                    Text("__________________________",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff0C3C97)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      children: const [
                        Icon(Icons.facebook),
                        Text("Sign up with facebook")
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.9,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 100.0),
                    child: Row(
                      children: const [
                        Icon(Icons.widgets),
                        Text("Sign up with google")
                      ],
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
