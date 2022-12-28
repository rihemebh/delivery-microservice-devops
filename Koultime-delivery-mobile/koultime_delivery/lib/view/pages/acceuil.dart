import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:koultime_delivery/view/pages/menus-list.dart';

class Acceuil extends StatelessWidget {
  const Acceuil({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 190),
              child: Image.asset("assets/logo.PNG")),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.48,
          decoration: const BoxDecoration(
              color: Colors.black, //Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: const [
                    Center(
                        child: Text(
                      "Welcome to Koul Time",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          decoration: TextDecoration.none,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    )),
                    SizedBox(height: 5),
                    Center(
                        child: Text(
                      "All your food in one Place",
                      style: TextStyle(
                          fontFamily: 'Arial',
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                          fontSize: 18),
                    )),
                  ],
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.white)),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MenuList();
                      }));
                    },
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    child: const Text(
                      "Get Started",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
