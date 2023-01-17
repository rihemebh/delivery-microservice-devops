import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:koultime_delivery/data/menu-item.dart';

class ItemService {
  Future<List<dynamic>> getItems() async {
    try {
      var url = Uri.parse("http://20.67.140.160:3000/products");

      var response = await http.get(url);

      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> makeOrder(List<int> itemsList) async {
    try {
      var url = Uri.parse("http://20.67.140.160:3000/add-order");
      Map body = {
        "username": "riheme",
        "items": itemsList.toString(),
      };
      Map<String, String> customHeaders = {"content-type": "application/json"};

      var response =
          await http.post(url, headers: customHeaders, body: json.encode(body));
    } catch (e) {}
  }
}

class AddToCart extends GetxController {
  List<Item> lst = [];
  int cost = 0;
  List<int> ids = [];
  add(Item menuItem) {
    lst.add(menuItem);
    ids.add(menuItem.id);
    cost += menuItem.price;
    update();
  }

  del(int index) {
    lst.removeAt(index);
    ids.removeAt(index);
    update();
  }

  delAll() {
    lst.clear();
    ids.clear();
    cost = 0;
    update();
  }
}
