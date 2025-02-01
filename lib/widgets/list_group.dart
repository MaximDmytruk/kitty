import 'package:flutter/material.dart';
import 'package:kitty/model/financial_transaction.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';
import 'package:kitty/widgets/list_item.dart';

class ListGroup extends StatefulWidget {
  final List<FinancialTransaction>? transactions;

  const ListGroup({
    super.key,
    this.transactions,
  });

  @override
  State<ListGroup> createState() => _ListGroupState();
}

class _ListGroupState extends State<ListGroup> {
  late List<ListItem>? listItems;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 16.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            8.0,
          ),
          border: Border.all(
            color: ColorsApp.lightGrey224,
          ),
        ),
        child: Column(
          spacing: 12.0,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'data'.toUpperCase(),
                  style: interTextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.grey66,
                  ),
                ),
                Text(
                  '-1125',
                  style: interTextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.grey66,
                  ),
                ),
              ],
            ),
            ListItem(
              firstName: 'Notes will come here',
              secondName: 'Category name',
              value: -500,
              iconAssetName: CategoryIcons.bar,
              iconBackground: const Color.fromARGB(255, 54, 212, 197),
            ),
            ListItem(
              firstName: 'Notes will come here',
              secondName: 'Category name',
              value: -500,
              iconAssetName: CategoryIcons.bar,
              iconBackground: ColorsApp.green,
            ),
            ListItem(
              firstName: 'Notes will come here',
              secondName: 'Category name',
              value: -500,
              iconAssetName: CategoryIcons.bar,
              iconBackground: ColorsApp.lightBlue168,
            ),
          ],
        ),
      ),
    );
  }
}
