import 'package:alcool_gasolina/widgets/input.widget.dart';
import 'package:alcool_gasolina/widgets/loading-button.widget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class SubmitForm extends StatelessWidget {
  var gasCtrl = MaskTextInputFormatter();
  var alcCtrl = MaskTextInputFormatter();
  var busy = false;
  final VoidCallback submitFunc;
  SubmitForm(
      {super.key,
      required this.alcCtrl,
      required this.busy,
      required this.gasCtrl,
      required this.submitFunc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "Gasolina",
            inputFormatter: gasCtrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            label: "Alcool",
            inputFormatter: alcCtrl,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        LoadingButton(
          busy: busy,
          func: submitFunc,
          text: "CALCULAR",
          invert: false,
        ),
      ],
    );
  }
}
