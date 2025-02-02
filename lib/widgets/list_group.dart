import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/model/financial_transaction.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';
import 'package:kitty/widgets/list_item.dart';

class ListGroup extends StatefulWidget {
  final List<FinancialTransaction> transactions;

  const ListGroup({
    super.key,
    required this.transactions,
  });

  @override
  State<ListGroup> createState() => _ListGroupState();
}

class _ListGroupState extends State<ListGroup> {
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
          vertical: 8.0,
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
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.transactions.length,
              itemBuilder: (context, index) {
                final transaction = widget.transactions[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: ListItem(
                    firstName: transaction.category.name,
                    secondName: transaction.category.name,
                    value: transaction.amount,
                    icon: transaction.category.icon,
                    colorIconBackground: transaction.category.color,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
