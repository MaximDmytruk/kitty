import 'package:flutter/material.dart';
import 'package:kitty/styles/colors/colors_app.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: KittyColors.grey33WithOpacity,
      height: MediaQuery.of(context).padding.top,
    );
  }
}
