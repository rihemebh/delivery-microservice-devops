import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:koultime_delivery/data/menu-item.dart';

class ItemService {
  Future<List<dynamic>> getItems() async {
    try {
      var url = Uri.parse(
          "http://34.201.41.26/menu-items?fbclid=IwAR2ofNwppY_jP5m0JHazAwJE1L_Qr1WYQdq4RU_JdlItoBgzQDh14YYIHOs");

      var response = await http.get(url);

      return jsonDecode(response.body);
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> makeOrder(List<int> itemsList) async {
    try {
      var url = Uri.parse("http://44.202.155.192:4001/online-order");
      Map body = {
        "type": "online",
        "orderedItems": itemsList.toString(),
        "address": 'Rue habib borguiba'
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
