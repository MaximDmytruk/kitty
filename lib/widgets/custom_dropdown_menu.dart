import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';

class CustomDropdownMenu extends StatefulWidget {
  final String selectedValue;
  final EdgeInsets? padding;
  final ValueChanged onSelected;

  const CustomDropdownMenu(
      {super.key,
      required this.selectedValue,
      this.padding,
      required this.onSelected});

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll(
          KittyColors.white,
        ),
      ),
      initialSelection: widget.selectedValue,
      expandedInsets: widget.padding,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 'Income', label: 'Income'),
        DropdownMenuEntry(value: 'Expense', label: 'Expense'),
      ],
      onSelected: (value) {
        if (value != null) {
          widget.onSelected(value);
        }
      },
    );
  }
}
