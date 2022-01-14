
import 'package:app/screens/filtered/indivudial/datas.dart';
import 'package:flutter/material.dart';

class IndivudialPage extends StatefulWidget {
  var forwards;
  IndivudialPage({Key? key, this.forwards}) : super(key: key);

  @override
  _IndivudialPageState createState() => _IndivudialPageState();
}

class _IndivudialPageState extends State<IndivudialPage> {
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  DateTime _initalDate = DateTime.now();
  DateTime _firstDate = DateTime(2012);
  DateTime _lastDate = DateTime(2024);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [
          Icon(Icons.bookmark_border),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemBuilder: (context, index) {
                  return Image.asset(widget.forwards[2]);
                },
                itemCount: 1,
              ),
            ),
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.forwards[0],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.amber,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.005,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.forwards[1],
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.forwards[3],
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5, right: 10.0),
                          child: Text("5"),
                        ),
                        Text("24 reviews")
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: const Text(
                        "Rent Duration",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "From",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextFormField(
                                  controller: _from,
                                  decoration: InputDecoration(
                                      prefixIcon: InkWell(
                                        child: const Icon(Icons.calendar_today),
                                        onTap: () {
                                          showDatePicker(
                                                  context: context,
                                                  initialDate: _initalDate,
                                                  firstDate: _firstDate,
                                                  lastDate: _lastDate)
                                              .then((value) => {
                                                    _from.text =
                                                        value.toString(),
                                                    filteredFrom = _from.text,
                                                  });
                                        },
                                      ),
                                      hintText: "Choose",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                )
                              ]),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.05,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "To",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                controller: _to,
                                decoration: InputDecoration(
                                    prefixIcon: InkWell(
                                      child: const Icon(Icons.calendar_today),
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: _initalDate,
                                                firstDate: _firstDate,
                                                lastDate: _lastDate)
                                            .then((value) => {
                                                  _to.text = value.toString(),
                                                  filteredTo = _to.text,
                                                });
                                      },
                                    ),
                                    hintText: "Choose",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: const Text(
                        "Rent Duration",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Text(
                      "Black",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.02,
                      ),
                      child: const Text(
                        "Main options",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.check_box_rounded),
                            Text(
                              "Black",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.check_box_rounded),
                            Text(
                              "Parking system",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.check_box_rounded),
                            Text(
                              "Black",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Icon(Icons.check_box_rounded),
                            Text(
                              "Parking system",
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.04,
                      ),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.065,
                        width: double.infinity,
                        child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          child: const Text(
                            "Book now",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/booking');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
