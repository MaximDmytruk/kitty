import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

class TagButton extends StatefulWidget {
  final Widget iconWidget;
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const TagButton({
    super.key,
    required this.iconWidget,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 32.0,
          padding: EdgeInsets.symmetric(
            vertical: 6.0,
            horizontal: 8.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0,),
            border: Border.all(
              color: widget.isSelected ? ColorsApp.blue106 : ColorsApp.grey189,
            ),
            color: widget.isSelected
                ? ColorsApp.lightBlue219
                : ColorsApp.transparent,
          ),
          child: Row(
            children: [
              widget.isSelected
                  ? SvgPicture.asset(
                      IconsApp.selectedOk,
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
      ),
    );
  }
}
