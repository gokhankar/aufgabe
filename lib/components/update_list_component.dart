import 'package:aufgabe/components/update_list_item_component.dart';
import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatetListComponent extends StatelessWidget {
  final double width;
  final UpdateController updateController;

  const UpdatetListComponent({
    super.key,
    required this.width,
    required this.updateController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Obx(
        () => updateController.updateList.isEmpty
            ? Center(
                child: Text(updateController.updateListText.value),
              )
            : ListView.builder(
                itemCount: updateController.updateList.length,
                itemBuilder: (BuildContext context, int index) {
                  return UpdateListItemComponent(
                      width: width,
                      update: updateController.updateList[index],
                      index: index);
                }),
      ),
    );
  }
}
