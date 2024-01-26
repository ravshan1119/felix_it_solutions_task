import 'package:felix_it_solutions_task/src/utils/resources/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.controller,
    this.maxLines,
    this.keyboardType,
    this.textInputAction,
  });

  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    var maskFormatter = MaskTextInputFormatter(
        mask: '(##) ###-##-##',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            fontFamily: "Mulish",
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff232638),
          ),
          textAlign: TextAlign.left,
        ),
        5.ph,
        TextField(
          textInputAction: textInputAction,
          inputFormatters:
              keyboardType == TextInputType.phone ? [maskFormatter] : null,
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontFamily: "Mulish",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff949ca9),
              height: 22 / 14,
            ),
            prefixIcon: keyboardType == TextInputType.phone
                ? const Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "+998",
                      style: TextStyle(
                        fontFamily: "Mulish",
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff01001f),
                      ),
                    ),
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
          ),
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(
            fontFamily: "Mulish",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xff01001f),
          ),
          textAlign: TextAlign.left,
        )
      ],
    );
  }
}
