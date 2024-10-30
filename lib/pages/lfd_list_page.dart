import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/home_page_controller.dart';
import 'package:aufgabe/controllers/change_controller.dart';
import 'package:aufgabe/pages/aufgabe2_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LfdListPage extends StatelessWidget {
  LfdListPage({super.key});
  final homePageController = Get.put(HomePageController());
  final lfdController = Get.put(ChangeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text("Lfdlist"),
          centerTitle: true,
        ),
        body: homePageController.isLoading.value
            ? Center(
                child: Text(homePageController.loadingText.value),
              )
            : Obx(
                () => Container(
                    child: lfdController.changeList.isEmpty
                        ? Center(
                            child: Text(lfdController.changeListText.value),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) {
                              return const Divider(
                                indent: 20,
                                endIndent: 20,
                              );
                            },
                            itemCount: lfdController.changeList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Aufgabe2Page(
                                            change: lfdController
                                                .changeList[index])),
                                  );
                                },
                                child: ListTile(
                                  leading: Text(
                                    "lfd : ${lfdController.changeList[index].change.toString()}",
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
