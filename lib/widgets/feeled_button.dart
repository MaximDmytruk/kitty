import 'package:flutter/material.dart';

class FeeledButton extends StatefulWidget {
  final Function onPressed;

  const FeeledButton({super.key, required this.onPressed});

  @override
  State<FeeledButton> createState() => _FeeledButtonState();
}

class _FeeledButtonState extends State<FeeledButton> {
  void buttonAction() {
    widget.onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: buttonAction,
        child: Text(
          'asdsa',
        ));
  }
}
