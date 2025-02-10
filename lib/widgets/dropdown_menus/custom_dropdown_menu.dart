import 'package:flutter/material.dart';
import 'package:kitty/data/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';

class CustomDropdownMenu extends StatefulWidget {
  final FinancialAction selectedValue;
  final String? label;
  final EdgeInsets? padding;
  final ValueChanged<FinancialAction> onSelected;
  final List<DropdownMenuEntry<FinancialAction>> dropdownMenuEntries;

  const CustomDropdownMenu({
    super.key,
    required this.selectedValue,
    this.padding,
    required this.onSelected,
    this.label,
    required this.dropdownMenuEntries,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<FinancialAction>(
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
      dropdownMenuEntries: widget.dropdownMenuEntries,
      onSelected: (value) {
        if (value != null) {
          widget.onSelected(value);
        }
      },
    );
  }
}
