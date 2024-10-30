import 'package:aufgabe/controllers/home_page_controller.dart';
import 'package:aufgabe/models/shop_model.dart';
import "../services/database_service.dart";

import 'package:get/get.dart';

class ShopController extends GetxController {
  final HomePageController homePageController = Get.find();

  var shopList = <ShopModel>[].obs;
  var shopListText = "Machine list is being created".obs;
  var shop = ShopModel().obs;
  @override
  void onInit() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1), () {});
      if (!homePageController.isLoading.value) {
        getShopList();
        return;
      }
    }
    await Future.delayed(const Duration(seconds: 3), () {});

    super.onInit();
  }

  Future getShopList() async {
    // print("getshopList called");
    shopListText.value = "Machine list is being created";
    shopList.clear();
    var result = await DatabaseService.instance.getShopList();
    shopList.addAll(result);
    shopList.refresh();
    if (shopList.isEmpty) shopListText.value = "Machine list is empty";
  }

  void getShopInfoByShopNumber(int num) {
    DatabaseService.instance.getShopInfoByShopnumber(num);
  }

  void getShopAllInfoByShopNumber(int num) {
    DatabaseService.instance.getShopAllInfoByShopnumber(num);
  }
}
