import 'package:aufgabe/constants.dart';
import 'package:aufgabe/models/update_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class Artikel extends StatelessWidget {
  final bool isNew;
  final UpdateModel update;
  Artikel({super.key, required this.isNew, required this.update});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 150,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: SizedBox(
              height: 50,
              child: Image.asset('assets/images/placeholder.jpg'),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isNew ? 'Neuer Artikel' : 'Alter Artikel',
                  style: sArtikelText.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  isNew ? update.price1!.toString() : update.price2!.toString(),
                  style: sArtikelText.copyWith(color: primaryColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  isNew
                      ? '${update.city} / ${update.idn}'
                      : '${update.price1} / ${update.price2}',
                  style: sArtikelText.copyWith(color: primaryColor),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  isNew
                      ? toCurrencyString(update.price2.toString(),
                          mantissaLength: 2,
                          thousandSeparator: ThousandSeparator.Period,
                          trailingSymbol: CurrencySymbols.EURO_SIGN)
                      : toCurrencyString(update.price2.toString(),
                          mantissaLength: 2,
                          thousandSeparator: ThousandSeparator.Period,
                          trailingSymbol: CurrencySymbols.EURO_SIGN),
                  style: sArtikelText.copyWith(color: primaryColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
