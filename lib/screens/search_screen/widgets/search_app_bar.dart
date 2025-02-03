import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';

class SearchAppBar extends StatefulWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  TextEditingController textController = TextEditingController();

  void onTapBack(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    textController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: ColorsApp.lightGrey245,
          child: Column(
            children: [
              Row(
                spacing: 16.0,
                children: [
                  SizedBox(
                    width: 0.0,
                  ),
                  InkWell(
                    onTap: () {
                      onTapBack(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: TextField(
                      controller: textController,
                      autofocus: true,
                      cursorColor: ColorsApp.black,
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: AppLocale.searchNotesCategoriesOrLabels,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 8.0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(
                          color: ColorsApp.grey189,
                        ),
                      ),
                      child: Row(
                        spacing: 4.0,
                        children: [
                          SvgPicture.asset(
                            CategoryIcons.maintenance,
                            colorFilter: const ColorFilter.mode(
                              ColorsApp.grey117,
                              BlendMode.srcIn,
                            ),
                          ),
                          Text(
                            'Gorcery',
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
            ],
          ),
        ),
      ],
    );
  }
}
