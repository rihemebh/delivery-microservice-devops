import 'dart:ffi';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:koultime_delivery/services/items-services.dart';
import 'package:koultime_delivery/view/pages/cart.dart';
import 'package:koultime_delivery/view/widgets/menu-card.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  late List<dynamic> items;
  late bool loading = true;
  late String selectedCateg = "";
  late Set<String> categories = {};

  void getItems() async {
    ItemService service = ItemService();

    List<dynamic> list = await service.getItems();
    Set<String> cat = {};
    if (mounted) {
      setState(() {
        items = list;
        loading = false;
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        for (int i = 0; i < list.length; i++) {
          cat.add(list[i]['category']);
        }
        setState(() {
          selectedCateg = cat.elementAt(0);
          categories = cat;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    /*  Timer mytimer = Timer.periodic(Duration(seconds: 2), (timer) {
      getItems();
    });*/
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        actions: [
          GestureDetector(
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (_) {
              return Cart();
            })),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
              size: 30,
            ),
          )
        ],
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Center(
          child: Text(
            "Kool Time Menu",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: RichText(
                  text: const TextSpan(
                      text: "Find your best",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 36,
                          color: Colors.black),
                      children: <TextSpan>[
                    TextSpan(
                        text: " Food ", style: TextStyle(color: Colors.red)),
                    TextSpan(text: "with us"),
                  ])),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return TextButton(
                      onPressed: () {
                        setState(() {
                          selectedCateg = categories.elementAt(index);
                        });
                      },
                      child: (Row(
                        // crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: EdgeInsets.only(right: 12, left: 12),
                            height: 23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color:
                                  categories.elementAt(index) == selectedCateg
                                      ? Colors.red
                                      : Colors.white,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  categories.elementAt(index),
                                  style: TextStyle(
                                      color: categories.elementAt(index) ==
                                              selectedCateg
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                    );
                  },
                )),
            const SizedBox(
              height: 20,
            ),
            loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) =>
                            selectedCateg == items[index]['category']
                                ? MenuCard(
                                    index: -1,
                                    id: items[index]['id'],
                                    cart: false,
                                    imagePath: items[index]['imagePath'],
                                    name: items[index]['name'],
                                    available: items[index]['available'],
                                    description: items[index]['description'],
                                    rate: items[index]['rate'],
                                    price: items[index]['price'],
                                  )
                                : Container()))
          ],
        ),
      ),
    );
  }
}
