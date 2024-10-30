import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/home_page_controller.dart';
import 'package:aufgabe/controllers/shop_controller.dart';
import 'package:aufgabe/pages/aufgabe1_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutomatenListPage extends StatelessWidget {
  AutomatenListPage({super.key});
  final homePageController = Get.put(HomePageController());
  final shopController = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Shoplist"),
          centerTitle: true,
        ),
        body: homePageController.isLoading.value
            ? Center(
                child: Text(homePageController.loadingText.value),
              )
            : Obx(
                () => Container(
                    child: shopController.shopList.isEmpty
                        ? Center(
                            child: Text(shopController.shopListText.value),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Divider(
                                indent: 20,
                                endIndent: 20,
                              );
                            },
                            itemCount: shopController.shopList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Aufgabe1Page(
                                            shop: shopController
                                                .shopList[index])),
                                  );
                                },
                                child: ListTile(
                                  leading: Text(
                                    "shopId : ${shopController.shopList[index].shop}"
                                        .toString(),
                                    style: sTitle,
                                  ),
                                  trailing: const Icon(Icons.open_in_new),
                                ),
                              );
                            },
                          )),
              ),
      ),
    );
  }
}
