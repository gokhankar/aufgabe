import 'package:aufgabe/constants.dart';
import 'package:aufgabe/models/update_model.dart';
import 'package:flutter/material.dart';

class BezeichnungComponent extends StatelessWidget {
  final UpdateModel update;
  const BezeichnungComponent({super.key, required this.update});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "IDN : ${update.idn}",
            style: sArtikelText,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 45,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: update.accepted == "N" ? error : success),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' ',
                      style: sArtikelText.copyWith(color: appBarColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Bezeichnung",
                      style: sArtikelText.copyWith(color: textColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Artikelnr/Index',
                      style: sArtikelText.copyWith(color: textColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "KVP",
                      style: sArtikelText.copyWith(color: textColor),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
