import 'package:aufgabe/components/button_component.dart';
import 'package:aufgabe/components/price_changer_component.dart';
import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/change_controller.dart';
import 'package:aufgabe/models/change_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Aufgabe2Page extends StatelessWidget {
  final ChangeModel change;
  Aufgabe2Page({super.key, required this.change});
  final lfdController = Get.put(ChangeController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: lightYellow,
              border: Border.all(width: 1, color: borderColor),
            ),
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: PriceChangerComponent(change: change)),
          ),
          const SizedBox(
            height: 100,
          ),
          ButtonComponent(
              width: width,
              title: "Back",
              onPressed: () {
                Navigator.pop(context);
              })
        ]),
      ),
    );
  }
}
