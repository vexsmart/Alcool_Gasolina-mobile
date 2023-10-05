import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Input extends StatefulWidget {
  final String label;
  final MaskTextInputFormatter inputFormatter;
  const Input({super.key, required this.inputFormatter, required this.label});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          alignment: Alignment.centerRight,
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontFamily: "Big Shoulders Display",
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            inputFormatters: [widget.inputFormatter],
            keyboardType: TextInputType.number,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              color: Colors.white,
              fontFamily: "Big Shoulders Display",
              fontSize: 45,
            ),
            textAlign: TextAlign.left,
            decoration: const InputDecoration(
              hintText: "\$ 0,00",
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
