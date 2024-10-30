import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/home_page_controller.dart';
import 'package:aufgabe/models/update_model.dart';
import 'package:flutter/material.dart';
import "../services/database_service.dart";

import 'package:get/get.dart';

class UpdateController extends GetxController {
  final HomePageController homePageController = Get.find();
  var updateList = <UpdateModel>[].obs;
  var updateListText = "Update list is being created".obs;
  var updateModel = UpdateModel().obs;

  @override
  void onInit() async {
    for (var i = 0; i < 10; i++) {
      await Future.delayed(const Duration(seconds: 1), () {});
      if (!homePageController.isLoading.value) {
        getUpdateList();
        return;
      }
    }

    super.onInit();
  }

  Future getUpdateList() async {
    print("getshopList called");
    updateListText.value = "Update list is being created";
    updateList.clear();
    var result = await DatabaseService.instance.getSortUpdateten();
    // print("controller getUpdateList: ${result.toString()}");
    updateList.addAll(result);
    updateList.refresh();
    if (updateList.isEmpty) updateListText.value = "Update list is empty";
  }

  void updateUpdateByIdn(int changeNum, kzsoum, idn) async {
    try {
      print(
          "UPDATE Jadauent2 SET kzsoum$kzsoum WHERE change=$changeNum AND idn=$idn;");

      await DatabaseService.instance.updateSortUpdate(changeNum, kzsoum, idn);
      getUpdateList();

      Get.snackbar(
        snackPosition: SnackPosition.BOTTOM,
        "Success",
        "Update Updated",
        colorText: primaryColor,
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.handshake,
          color: primaryColor,
        ),
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
