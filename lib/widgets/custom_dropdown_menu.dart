import 'package:flutter/material.dart';

class CustomDropdownMenu extends StatefulWidget {
  final String selectedValue;
  final EdgeInsets? padding;

  const CustomDropdownMenu({super.key, required this.selectedValue, this.padding});

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      initialSelection: widget.selectedValue,
      expandedInsets: widget.padding,
      dropdownMenuEntries: [
        DropdownMenuEntry(value: 'Income', label: 'Income'),
        DropdownMenuEntry(value: 'Expense', label: 'Expense'),
      ],
      onSelected: (value) {
        if (value != null) {
          
          setState(() {});
        }
      },
    );
  }
}
