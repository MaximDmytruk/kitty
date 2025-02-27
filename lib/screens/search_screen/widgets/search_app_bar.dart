import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/widgets/buttons/tag_button.dart';

class SearchAppBar extends StatefulWidget {
  final TextEditingController textController;
  final List<FinancialCategory> categories;
  final Function? onSubmitted;

  const SearchAppBar({
    super.key,
    required this.textController,
    required this.categories,
    this.onSubmitted,
  });

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  List<int> selectedCategoryIds = [];

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
                  onSubmitted: (value) {
                    if (widget.onSubmitted != null) {
                      widget.onSubmitted!(
                        value,
                        selectedCategoryIds,
                      );
                    }
                  },
                  controller: widget.textController,
                  autofocus: true,
                  cursorColor: ColorsApp.black,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: AppLocale.searchNotesCategoriesOrLabels.getString(context),
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
              padding: EdgeInsets.only(
                bottom: 8.0,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                final FinancialCategory category = widget.categories[index];
                final bool isSelected = selectedCategoryIds.contains(
                  category.id,
                );

                return TagButton(
                  iconWidget: SvgPicture.asset(
                    category.iconPath,
                  ),
                  name: category.name,
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedCategoryIds.remove(category.id);
                      } else {
                        selectedCategoryIds.add(category.id!);
                      }
                    });

                    if (widget.onSubmitted != null) {
                      widget.onSubmitted!(
                        widget.textController.text,
                        selectedCategoryIds,
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
