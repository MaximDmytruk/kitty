import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

class TagButton extends StatefulWidget {
  final Widget iconWidget;
  final String name;

  const TagButton({
    super.key,
    required this.iconWidget,
    required this.name,
  });

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  bool selected = false;
  String selectedIconAdress = IconsApp.selectedOk;

  void selectAction() {
    setState(() {
      if (selected) {
        selected = false;
      } else {
        selected = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: InkWell(
        onTap: selectAction,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 32.0,
              padding: EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 8.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  6.0,
                ),
                border: Border.all(
                  color: selected ? ColorsApp.blue106 : ColorsApp.grey189,
                ),
                color:
                    selected ? ColorsApp.lightBlue219 : ColorsApp.transparent,
              ),
              child: Row(
                spacing: 4.0,
                children: [
                  selected
                      ? SvgPicture.asset(
                          selectedIconAdress,
                          fit: BoxFit.none,
                        )
                      : widget.iconWidget,
                  Text(
                    widget.name,
                    style: interTextStyle(
                      color: ColorsApp.grey66,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
