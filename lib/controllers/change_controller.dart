import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/home_page_controller.dart';
import 'package:aufgabe/models/change_model.dart';
import 'package:flutter/material.dart';
import "../services/database_service.dart";
import 'package:get/get.dart';

class ChangeController extends GetxController {
  final HomePageController homePageController = Get.find();

  var changeList = <ChangeModel>[].obs;
  var changeListText = "change list is being created".obs;
  var change = ChangeModel().obs;
  var changePrice = 0.00.obs;

  @override
  void onInit() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1), () {});
      if (!homePageController.isLoading.value) {
        getChangeList();

        return;
      }
    }

    super.onInit();
  }

  Future getChangeList() async {
    // print("getChangeList called");
    changeListText.value = "change list is being created";
    changeList.clear();
    var result = await DatabaseService.instance.getChangeList();
    changeList.addAll(result);
    changeList.refresh();
    if (changeList.isEmpty) changeListText.value = "change list is empty";
  }

  void getChangeInfoByChangeNumber(int num) {
    DatabaseService.instance.getChangeInfoByChangenumber(num);
  }

  void getChangeAllInfoByChangeNumber(int num) {
    DatabaseService.instance.getChangeAllInfoByChangenumber(num);
  }

  void updatePriceByChangenumber(int changeNum, double newPrice) async {
    try {
      await DatabaseService.instance
          .updatePriceByChangenumber(changeNum, newPrice);
      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        "Success",
        "Database Updated",
        colorText: primaryColor,
        backgroundColor: Colors.green,
        icon: const Icon(Icons.handshake),
      );
      getChangeList();
    } catch (e) {
      print(e.toString());
    }
  }
}
