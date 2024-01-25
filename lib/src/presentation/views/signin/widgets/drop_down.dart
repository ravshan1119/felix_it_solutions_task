import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:felix_it_solutions_task/src/utils/resources/app_icons.dart';
import 'package:felix_it_solutions_task/src/utils/resources/size_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../translations/locale_keys.g.dart';

class DropDownItem extends StatefulWidget {
  const DropDownItem({super.key});

  @override
  State<DropDownItem> createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  final List<String> languageItems = [
    'English',
    'Россия',
    'Uzbek',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.lan.tr(),
            style: const TextStyle(
              fontFamily: "Mulish",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xff232638),
            ),
          ),
          5.ph,
          Form(
            key: _formKey,
            child: DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  focusColor: Colors.blue,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      AppIcons.uz,
                      height: 12,
                      width: 24,
                    ),
                  )),
              hint: const Text(
                "Choose a language",
                style: TextStyle(
                  fontFamily: "Mulish",
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff949ca9),
                ),
                textAlign: TextAlign.left,
              ),
              items: languageItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
                return null;
              },
              onChanged: (value) async {
                if (selectedValue == "Россия") {
                  await context.setLocale(const Locale('ru'));
                } else if (selectedValue == "English") {
                  await context.setLocale(const Locale('en'));
                } else if (selectedValue == "Uzbek") {
                  await context.setLocale(const Locale('uz'));
                }
                setState(() {});
              },
              onSaved: (value) async {
                selectedValue = value.toString();
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.only(right: 8),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xFF01001F),
                ),
                iconSize: 24,
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
