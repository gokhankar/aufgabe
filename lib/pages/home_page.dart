import 'package:aufgabe/components/button_component.dart';
import 'package:aufgabe/controllers/home_page_controller.dart';
import 'package:aufgabe/controllers/change_controller.dart';
import 'package:aufgabe/controllers/shop_controller.dart';
import 'package:aufgabe/controllers/update_controller.dart';
import 'package:aufgabe/pages/aufgabe_page.dart';
import 'package:aufgabe/pages/automaten_list_page.dart';
import 'package:aufgabe/pages/lfd_list_page.dart';
import 'package:aufgabe/pages/update_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final homePageController = Get.put(HomePageController());
  final shopController = Get.put(ShopController());
  final changeController = Get.put(ChangeController());
  final updateController = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Aufgaben"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonComponent(
                  width: width,
                  title: "Aufgabe shopinfo",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AutomatenListPage()),
                    );
                  }),
              SizedBox(
                height: 30,
              ),
              ButtonComponent(
                  width: width,
                  title: "Aufgabe Gelderfassung",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LfdListPage()),
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
              ButtonComponent(
                  width: width,
                  title: "Aufgabe Sortenupdate",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UpdateListPage(
                                title: "Update List",
                              )),
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
              ButtonComponent(
                  width: width,
                  title: "Mock",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AufgabePage(
                            change: changeController.changeList.value
                                .where((item) => item.change == 14)
                                .first,
                            shop: shopController.shopList.value
                                .where((item) => item.shop == 574743)
                                .first),
                      ),
                    );
                  }),
            ],
          ),
        ));
  }
}
