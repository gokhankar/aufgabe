import 'package:aufgabe/components/button_component.dart';
import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/shop_controller.dart';
import 'package:aufgabe/models/shop_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Aufgabe1Page extends StatelessWidget {
  final ShopModel shop;
  Aufgabe1Page({super.key, required this.shop});
  final shopController = Get.put(ShopController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: lightBlue,
                          border: Border.all(width: 1, color: borderColor)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Shop',
                                        style:
                                            sTitle.copyWith(color: textColor),
                                      )),
                                  Expanded(
                                      flex: 5,
                                      child: Text(
                                        shop.shop.toString(),
                                        style: sTableText.copyWith(
                                            color: textColor),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Text(
                                        'Anschrift',
                                        style:
                                            sTitle.copyWith(color: textColor),
                                      )),
                                  Expanded(
                                      flex: 5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            shop.name2 ?? "",
                                            style: sTableText.copyWith(
                                                color: textColor),
                                          ),
                                          Text(
                                            shop.name1 ?? "",
                                            style: sTableText.copyWith(
                                                color: textColor),
                                          ),
                                          Text(
                                            shop.str ?? "",
                                            style: sTableText.copyWith(
                                                color: textColor),
                                          ),
                                          Text(
                                            '${shop.plz}  ${shop.ort}',
                                            style: sTableText.copyWith(
                                                color: textColor),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
                  ],
                ),
              )),
        ]),
      ),
    );
  }
}
