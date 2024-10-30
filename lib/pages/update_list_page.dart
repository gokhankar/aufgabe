import 'package:aufgabe/components/update_list_component.dart';
import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/update_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateListPage extends StatelessWidget {
  final String title;
  UpdateListPage({super.key, required this.title});

  final updateController = Get.put(UpdateController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Artikelupdate',
              style: sTitle.copyWith(
                  color: primaryColor, fontSize: width < 500 ? 10 : 20),
            ),
            Text(
              title,
              style: sTitle.copyWith(
                  color: primaryColor, fontSize: width < 500 ? 10 : 20),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: UpdatetListComponent(
          width: width, updateController: updateController),
    );
  }
}
