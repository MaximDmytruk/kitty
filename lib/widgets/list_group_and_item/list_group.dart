import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/font/fontstyle_app.dart';
import 'package:kitty/widgets/list_group_and_item/list_item.dart';

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
  
  String dateOfTransaction = '';

  @override
  void initState() {
    print('Im in LISTGROUP!!----------------');
   
    print(widget.transactions);
    // transaction.sort((a, b) => a.date.compareTo(b.date));
    widget.transactions.reversed;
    print('');
    print(widget.transactions);
    dateOfTransaction = DateFormat('d/M/y').format(widget.transactions.first.date);
    print('IN ListGroup' );
    print(widget.transactions.length);
    print('');
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
                  dateOfTransaction,
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
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: ListItem(
                    firstName: widget.transactions[index].category.name,
                    secondName: widget.transactions[index].category.name,
                    value: widget.transactions[index].amount,
                    iconPath: widget.transactions[index].category.iconPath,
                    colorIconBackground: widget.transactions[index].category.colorValue,
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
