import 'package:aufgabe/constants.dart';
import 'package:aufgabe/controllers/change_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/currency_input_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';

class PriceInputComponent extends StatefulWidget {
  final ChangeController changeController;
  final String? initialValue;

  const PriceInputComponent({
    required this.changeController,
    this.initialValue = "0,00 €",
  });

  @override
  State<PriceInputComponent> createState() => _PriceInputComponentState();
}

class _PriceInputComponentState extends State<PriceInputComponent> {
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: toCurrencyString(widget.initialValue!,
          mantissaLength: 2,
          thousandSeparator: ThousandSeparator.Period,
          trailingSymbol: CurrencySymbols.EURO_SIGN),
      decoration: InputDecoration(
        // border: OutlineInputBorder(),
        focusedErrorBorder: null,
        errorBorder: null,
        disabledBorder: null,
        border: null,
        enabledBorder: null,
        focusedBorder: null,
        hintText: 'Enter a flat numeric value',
        hintStyle: TextStyle(
          color: textColor,
        ),
        errorStyle: const TextStyle(
          color: Colors.red,
        ),
      ),
      keyboardType: const TextInputType.numberWithOptions(decimal: false),
      inputFormatters: [
        LengthLimitingTextInputFormatter(11),
        CurrencyInputFormatter(
          thousandSeparator: ThousandSeparator.Period,
          mantissaLength: 2,
          maxTextLength: 6,
          trailingSymbol: ' €',
          onValueChange: (value) {
            widget.changeController.changePrice.value = value.toDouble();
          },
        ),
      ],
    );
  }
}
