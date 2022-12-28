import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:koultime_delivery/services/items-services.dart';
import 'package:koultime_delivery/view/widgets/menu-card.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int delivery = 2;
  @override
  Widget build(BuildContext context) {
    var orders = {};
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          actions: const [
            Icon(
              Icons.circle,
              color: Colors.transparent,
            )
          ],
          iconTheme: const IconThemeData(
            color: Colors.black, //change your color here
          ),
          title: const Center(
              child: Text(
            "My Orders",
            style: TextStyle(color: Colors.black),
          ))),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.55,
            child: GetBuilder<AddToCart>(
              init: AddToCart(),
              builder: (value) {
                return ListView.builder(
                    itemCount: value.lst.length,
                    itemBuilder: (context, index) {
                      return MenuCard(
                        cart: true,
                        index: index,
                        id: value.lst[index].id,
                        imagePath: value.lst[index].imagePath,
                        name: value.lst[index].name,
                        available: value.lst[index].available,
                        description: value.lst[index].description,
                        rate: value.lst[index].rate,
                        price: value.lst[index].price,
                      );
                    });
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width * 0.8,
            //height: 50,
            decoration: BoxDecoration(
                //color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Item Total",
                    style: TextStyle(fontSize: 15),
                  ),
                  GetBuilder<AddToCart>(
                      init: AddToCart(),
                      builder: (value) {
                        return Text(
                          "${value.cost} Dt",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        );
                      })
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Delivery",
                    style: TextStyle(fontSize: 15),
                  ),
                  GetBuilder<AddToCart>(
                      init: AddToCart(),
                      builder: (value) {
                        return Text(
                          "${value.cost == 0 ? 0 : delivery} Dt",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        );
                      }),
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  GetBuilder<AddToCart>(
                      init: AddToCart(),
                      builder: (value) {
                        return Text(
                          "${value.cost + (value.cost == 0 ? 0 : delivery)} Dt",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        );
                      })
                ],
              ),
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: GetBuilder<AddToCart>(
                  init: AddToCart(),
                  builder: (value) {
                    return ElevatedButton(
                      onPressed: () async {
                        await ItemService().makeOrder(value.ids);
                        value.delAll();
                        await Fluttertoast.showToast(
                            msg: 'Your order is sent ',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.green,
                            textColor: Colors.white);
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            value.lst.isEmpty ? Colors.grey : Colors.black),
                      ),
                      child: const Text(
                        "Make an order",
                        style: TextStyle(fontSize: 18),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
