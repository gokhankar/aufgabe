import 'package:aufgabe/components/button_component.dart';
import 'package:aufgabe/components/price_changer_component.dart';
import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/shop_controller.dart';
import 'package:aufgabe/models/change_model.dart';
import 'package:aufgabe/models/shop_model.dart';
import 'package:aufgabe/pages/update_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AufgabePage extends StatelessWidget {
  final ShopModel shop;
  final ChangeModel change;
  AufgabePage({super.key, required this.shop, required this.change});
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
                    Expanded(
                        flex: 3,
                        child: Container(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Shop',
                                            style: sTitle.copyWith(
                                                color: textColor),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          flex: 2,
                                          child: Text(
                                            'Anschrift',
                                            style: sTitle.copyWith(
                                                color: textColor),
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
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            color: lightYellow,
                            border: Border.all(width: 1, color: borderColor),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: PriceChangerComponent(change: change)),
                        )),
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                  color: darkYellow,
                  border: Border.all(width: 1, color: borderColor)),
              child: Container(
                padding: const EdgeInsets.all(10),
                child:
                    UpdateListPage(title: '349639 EWA - Zentrale + OTP-Regal'),
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: darkYellow,
            child: ButtonComponent(
              width: width,
              title: 'Updateten Speichern',
              onPressed: () {
                print("pressed");
              },
            ),
          )
        ]),
      ),
    );
  }
}
