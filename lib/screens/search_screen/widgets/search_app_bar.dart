import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/styles/colors/colors_app.dart';

import 'package:kitty/styles/icons/category_icons.dart';
import 'package:kitty/testing/testing_transaction.dart';
import 'package:kitty/widgets/buttons/tag_button.dart';

class SearchAppBar extends StatefulWidget {
  final TextEditingController textController;
  final List<FinancialCategory> categories;

  const SearchAppBar({
    super.key,
    required this.textController,
    required this.categories,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  void onTapBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.lightGrey250,
        border: Border(
          bottom: BorderSide(
            color: ColorsApp.lightGrey224,
          ),
        ),
      ),
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
                  controller: widget.textController,
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
          SizedBox(
            height: 48.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) => TagButton(
                iconWidget: SvgPicture.asset(categories[index].iconPath),
                name: categories[index].name,
              ),
            ),
          )
        ],
      ),
    );
  }
}
