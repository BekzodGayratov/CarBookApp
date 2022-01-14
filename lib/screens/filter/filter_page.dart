import 'package:app/screens/filter/datas.dart';
import 'package:app/screens/home/home_page.dart';
import 'package:app/screens/home/pictures.dart';
import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  RangeValues _values = RangeValues(100, 1000);
  RangeLabels? _labels;
  TextEditingController _from = TextEditingController();
  TextEditingController _to = TextEditingController();
  DateTime _initalDate = DateTime.now();
  DateTime _firstDate = DateTime(2012);
  DateTime _lastDate = DateTime(2024);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Filter",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: mainBody(context),
    );
  }

  SingleChildScrollView mainBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Data",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
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
                                            _from.text = value.toString(),
                                            from = _from.text,
                                          });
                                },
                              ),
                              hintText: "Choose",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
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
                                            to = _to.text,
                                          });
                                },
                              ),
                              hintText: "Choose",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        )
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              "Car brends",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Image.asset(emblems[index]));
                },
                itemCount: 4,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text(
              "Class",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.26,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: Image.asset(classPicture[index],
                              fit: BoxFit.cover),
                        ),
                        Text(classNames[index])
                      ],
                    ),
                  );
                },
                itemCount: classNames.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: const Text(
                "Price",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            RangeSlider(
              activeColor: Colors.yellow,
              divisions: 5,
              labels: _labels,
              min: 100,
              max: 1000,
              values: _values,
              onChanged: (v) {
                setState(
                  () {
                    _values = v;
                    _labels =
                        RangeLabels("${_values.start}\$", "${_values.end}\$");
                  },
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: const Text(
                "Km",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: OutlinedButton(
                      child: Text(km[index]),
                      onPressed: () {
                        setState(() {
                          if (indexes[index]) {
                            indexes[index] = false;
                          } else {
                            indexes[index] = true;
                            inputKm = km[index];
                          }
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: (indexes[index] == true)
                              ? Colors.amber
                              : Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 4,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02,
                  bottom: MediaQuery.of(context).size.height * 0.01),
              child: const Text(
                "Body type",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10.0),
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.18,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: (indexes2[index] == true)
                              ? Colors.amber
                              : Colors.grey,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(bodyTypes[0]),
                          Text(bodyTypeNames[index]),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(
                        () {
                          if (indexes2[index]) {
                            indexes2[index] = false;
                          } else {
                            indexes2[index] = true;
                            inputbodyTYPE = bodyTypeNames[index];
                          }
                        },
                      );
                    },
                  );
                },
                itemCount: bodyTypeNames.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.04,
              ),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.065,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  child: const Text(
                    "Apply filter",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    priceRange[0]['boshlanish'] = _values.start.toString();
                    priceRange[0]['tugash'] = _values.end.toString();
                    Navigator.pushNamed(context, '/filtered');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
