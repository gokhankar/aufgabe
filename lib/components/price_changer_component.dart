import 'package:aufgabe/components/button_component.dart';
import 'package:aufgabe/components/price_input_component.dart';
import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/change_controller.dart';
import 'package:aufgabe/models/change_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceChangerComponent extends StatelessWidget {
  final ChangeModel change;
  PriceChangerComponent({super.key, required this.change});
  final changeController = Get.put(ChangeController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
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
                    'GeldBetrag:',
                    style: sTitle.copyWith(color: textColor),
                  )),
              Expanded(
                flex: 3,
                child: PriceInputComponent(
                  changeController: changeController,
                  initialValue: change.price.toString(),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          ButtonComponent(
            width: width,
            title: 'Speichern',
            onPressed: () {
              // print(changeController.changePrice.value);
              changeController.updatePriceByChangenumber(
                  change.change!, changeController.changePrice.value);
            },
          ),
        ],
      ),
    );
  }
}
