import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

class SearchHistoryRow extends StatefulWidget {
  final String name;
  final Function? onTap;
  final Function? onDissmissed;

  const SearchHistoryRow({
    super.key,
    this.onTap,
    required this.name,
    this.onDissmissed,
  });

  @override
  State<SearchHistoryRow> createState() => _SearchHistoryRowState();
}

class _SearchHistoryRowState extends State<SearchHistoryRow> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: Container(
        color: ColorsApp.red,
      ),
      key: ValueKey(
        widget.name,
      ),
      onDismissed: (direction) {
        if (widget.onDissmissed != null) {
          widget.onDissmissed!(widget.name);
        }
      },
      child: InkWell(
        onTap: () {
          if (widget.onTap != null) {
            widget.onTap!(
              widget.name,
            );
          }
        },
        child: Row(
          children: [
            SvgPicture.asset(
              IconsApp.history,
            ),
            SizedBox(
              width: 12.0,
            ),
            Text(
              widget.name,
              style: interTextStyle(),
            ),
            Spacer(),
            SvgPicture.asset(
              IconsApp.northWestArrow,
            ),
          ],
        ),
      ),
    );
  }
}
