import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:koultime_delivery/data/menu-item.dart';
import 'package:koultime_delivery/services/items-services.dart';

class MenuCard extends StatefulWidget {
  final bool cart;

  final String name;
  final String description;
  final int price;
  final int rate;
  final String imagePath;
  final bool available;
  final int index;
  final int id;
  const MenuCard(
      {super.key,
      required this.cart,
      required this.index,
      required this.name,
      required this.description,
      required this.price,
      required this.rate,
      required this.imagePath,
      required this.available,
      required this.id});

  @override
  State<MenuCard> createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 105,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              offset: const Offset(
                50.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          /* boxShadow: [
            BoxShadow(
                color: Colors.grey.shade200, spreadRadius: 1, blurRadius: 15)
          ],*/
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                    width: 80,
                    height: 72,
                    color: Colors.grey,
                    child: Image(
                      image: NetworkImage(widget.imagePath),
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 140,
                      padding: EdgeInsets.only(bottom: 2),
                      child: Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 13),
                      ),
                    ),
                    Row(
                        children: List.generate(
                      5,
                      (index) => Icon(
                        Icons.star,
                        size: 10,
                        color:
                            index < widget.rate ? Colors.yellow : Colors.grey,
                      ),
                    )),
                    Container(
                        width: 130,
                        padding: EdgeInsets.only(bottom: 0, top: 4),
                        child: Text(widget.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 10))),
                    /* Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 18,
                          color:
                              index < widget.rate ? Colors.yellow : Colors.grey,
                        ),
                      ),
                    )*/
                  ],
                ),
              ],
            ),
            Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 17,
                  ),
                  Text(
                    "${widget.price}.00 Dt",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  widget.cart
                      ? GetBuilder<AddToCart>(
                          init: AddToCart(),
                          builder: (value) => ElevatedButton(
                              onPressed: (() {
                                value.del(widget.index);
                              }),
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(Colors.red),
                              ),
                              child: const Text(
                                "Remove",
                                style: TextStyle(fontSize: 10),
                              )))
                      : GetBuilder<AddToCart>(
                          init: AddToCart(),
                          builder: (value) => ElevatedButton(
                              onPressed: (() async {
                                value.add(Item(
                                    id: widget.id,
                                    name: widget.name,
                                    description: widget.description,
                                    price: widget.price,
                                    rate: widget.rate,
                                    imagePath: widget.imagePath,
                                    category: "",
                                    available: widget.available));

                                await Fluttertoast.showToast(
                                    msg: '${widget.name} Added to the Cart',
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white);
                              }),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll<Color>(
                                        widget.available == false
                                            ? Colors.grey
                                            : Colors.black),
                              ),
                              child: Text(
                                widget.available == false
                                    ? "N/A"
                                    : "Add to cart",
                                style: TextStyle(fontSize: 10),
                              )),
                        )

                  /*    ElevatedButton(
                          onPressed: (() {}),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                widget.available == false
                                    ? Colors.grey
                                    : Colors.red),
                          ),
                          child: Text(widget.available == false
                              ? "N/A"
                              : "Add to cart"))*/
                ]),
          ]),
    );
  }
}
