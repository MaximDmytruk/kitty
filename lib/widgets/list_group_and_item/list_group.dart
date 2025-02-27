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
  int sum = 0;

  @override
  void initState() {
    nameOfDate(date: widget.transactions.first.date);
    summ(transactions: widget.transactions);
    super.initState();
  }

  void summ({required List<FinancialTransaction> transactions}) {


    for (FinancialTransaction trns in transactions) {

      if (trns.financialAction == FinancialAction.income) {
        sum += trns.amount;
      } 

      if (trns.financialAction == FinancialAction.expense) {
        sum-= trns.amount;
      }
      
    }
  }

  void nameOfDate({required DateTime date}) {
    DateTime now = DateTime.now();

    if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day) {
      dateOfTransaction = 'T O D A Y';
    } else if (date.year == now.year &&
        date.month == now.month &&
        date.day == now.day - 1) {
      dateOfTransaction = 'Y E S T E R D A Y';
    } else {
      dateOfTransaction = DateFormat('d/M/y').format(date);
    }
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
                  sum.toString(),
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
                //Reverse for transactions
                final int reversedIndex =
                    widget.transactions.length - 1 - index;

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  child: ListItem(
                    transaction: widget.transactions[reversedIndex],
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
