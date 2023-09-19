import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetOf extends StatefulWidget {
  List products = [];
  List<Map<dynamic, dynamic>> product;

  WidgetOf({required this.product, super.key, required this.products});

  @override
  State<WidgetOf> createState() => _WidgetOfState();
}

int category = 0;

class _WidgetOfState extends State<WidgetOf> {
  @override
  Widget build(BuildContext context) {
    List<Map<dynamic, dynamic>> filteredData =
        widget.product.where((item) => item["category"] == category).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red.shade800,
          title: const Text('الرئيسية'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  'https://images.pexels.com/photos/1595087/pexels-photo-1595087.jpeg?auto=compress&cs=tinysrgb&w=400',
                  fit: BoxFit.cover,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'التصنيفات',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                        itemCount: widget.products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (c, i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      category = i + 1;
                                    });
                                  },
                                  child: Image.network(widget.products[i])),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 350,
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: (category == 0)
                            ? widget.products.length
                            : filteredData.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (c, i) {
                          Map<dynamic, dynamic> item = {};
                          if (category == 0) {
                            item = widget.product[i];
                          } else {
                            item = filteredData[i];
                          }

                          return Card(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                  width: double.infinity,
                                  child: Image.network(
                                    item['imageUrl'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    children: [
                                      Text(item['name']),
                                      const Spacer(),
                                      Text(item['price']),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.red.shade800)),
                                      child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('اضف الى السلة'),
                                          Icon(Icons.shopping_cart),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          );
                        }),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
