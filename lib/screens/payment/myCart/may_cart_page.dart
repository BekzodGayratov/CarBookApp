import 'package:app/screens/payment/payment_datas.dart';
import 'package:flutter/material.dart';

class MyCart extends StatefulWidget {
  var myCartInfo;
  MyCart({Key? key, this.myCartInfo}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  bool _isClicked = false;
  bool _isDelete = false;
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
        centerTitle: true,
        title: const Text(
          "Payment Method",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Column(
              children: [
                containerMain(),
              ],
            ),
          ),
          positionedMethod(context),
        ],
      ),
    );
  }

  positionedMethod(BuildContext context) {
    if (_isClicked) {
      return Positioned(
        top: MediaQuery.of(context).size.height * 0.068,
        left: MediaQuery.of(context).size.width * 0.47,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
            child: Column(
              children: [
                InkWell(
                  child: Row(
                    children: const [Icon(Icons.delete), Text("Delete card")],
                  ),
                  onTap: () {
                    setState(() {
                      _isDelete = true;
                      _isClicked = false;
                    });
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                InkWell(
                  child: Row(
                    children: const [Icon(Icons.settings), Text("Change card")],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return const Positioned(
        child: Text(""),
      );
    }
  }

  containerMain() {
    if (!_isDelete) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.26,
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(8.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Uzcard",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {
                      setState(() {
                        _isClicked = !_isClicked;
                        
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.05,
                ),
                child: Text(
                  "${paymentDatas['cardNumber']}",
                  style: const TextStyle(
                      fontSize: 21.0, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${paymentDatas['cardHolder']}",
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text("${paymentDatas['cardExperity']}",
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold))
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
