import 'package:alcool_gasolina/widgets/logo.widget.dart';
import 'package:alcool_gasolina/widgets/submit-form.dart';
import 'package:alcool_gasolina/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color onChangeColor = Colors.deepPurple;
  var busy = false;
  var completed = false;
  var resultText = "Compensa Utilizar Alcool";
  var alcMaskFormatter = MaskTextInputFormatter(
    mask: "\$#,##",
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
    initialText: "\$ 000.00",
  );
  var gasMaskFormatter = MaskTextInputFormatter(
    mask: "\$#,##",
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 1200),
        color: onChangeColor,
        child: ListView(
          children: <Widget>[
            const Logo(),
            completed
                ? Success(
                    reset: reset,
                    result: resultText,
                  )
                : SubmitForm(
                    alcCtrl: alcMaskFormatter,
                    busy: busy,
                    gasCtrl: gasMaskFormatter,
                    submitFunc: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  Future? calculate() {
    double alc = double.parse(alcMaskFormatter.getUnmaskedText()) / 100;
    double gas = double.parse(gasMaskFormatter.getUnmaskedText()) / 100;
    double res = alc / gas;

    setState(() {
      onChangeColor = Colors.deepPurpleAccent;
      completed = false;
      busy = true;
    });

    return Future.delayed(
        const Duration(seconds: 1),
        () => {
              setState(
                () {
                  if (res <= 0.7) {
                    resultText = "Compensa Utilizar Alcool";
                  } else {
                    resultText = "Compensa Utilizar Gasolina";
                  }

                  busy = false;
                  completed = true;
                },
              ),
            });
  }

  reset() {
    setState(() {
      onChangeColor = Theme.of(context).primaryColor;
      completed = false;
      busy = false;
    });
  }
}
