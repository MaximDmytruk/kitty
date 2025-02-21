import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';

class SearchHistoryRow extends StatefulWidget {
  final String name;
  final Function? onTap;

  const SearchHistoryRow({
    super.key,
    this.onTap,
    required this.name,
  });

  @override
  State<SearchHistoryRow> createState() => _SearchHistoryRowState();
}

class _SearchHistoryRowState extends State<SearchHistoryRow> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!(widget.name);
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
    );
  }
}
