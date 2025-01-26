import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class CustomDropdownMenu extends StatefulWidget {
  final String selectedValue;
  final String? label;
  final EdgeInsets? padding;
  final ValueChanged onSelected;

  const CustomDropdownMenu({
    super.key,
    required this.selectedValue,
    this.padding,
    required this.onSelected,
    this.label,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          ColorsApp.white,
        ),
      ),
      initialSelection: widget.selectedValue,
      expandedInsets: widget.padding,
      label: widget.label != null
          ? Text(
              widget.label!,
              style: interTextStyle(
                fontSize: 14.0,
              ),
            )
          : null,
      dropdownMenuEntries: [
        DropdownMenuEntry(
          value: 'Income',
          label: AppLocale.income.getString(context),
        ),
        DropdownMenuEntry(
          value: 'Expense',
          label: AppLocale.expenses.getString(context),
        ),
      ],
      onSelected: (value) {
        if (value != null) {
          widget.onSelected(value);
        }
      },
    );
  }
}
