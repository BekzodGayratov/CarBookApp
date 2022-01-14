import 'package:app/screens/filtered/datas.dart';
import 'package:flutter/material.dart';

class FilteredPage extends StatefulWidget {
  const FilteredPage({Key? key}) : super(key: key);

  @override
  _FilteredPageState createState() => _FilteredPageState();
}

class _FilteredPageState extends State<FilteredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          "Filter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(
            Icons.search,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: MediaQuery.of(context).size.height * 0.3,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  child: Container(
                    margin: const EdgeInsets.all(9.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            filteredNames[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              backgroundColor: Colors.amber,
                            ),
                          ),
                          Text(
                            filteredModel[index],
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                          Center(
                            child: SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.165,
                              child: Image.asset(index % 2 != 0
                                  ? filteredPic[0]
                                  : filteredPic[1]),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                filteredPay[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                              const Icon(Icons.bookmark_border)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/indivudial',
                      arguments: [
                        filteredNames[index],
                        filteredModel[index],
                        filteredPic[index],
                        filteredPay[index],
                      ],
                    );
                  },
                );
              },
              itemCount: filteredNames.length,
            ),
          )
        ],
      ),
    );
  }
}
