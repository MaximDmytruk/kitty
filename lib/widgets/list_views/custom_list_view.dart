import 'package:flutter/material.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/widgets/list_group_and_item/list_group.dart';

class CustomListView extends StatefulWidget {
  final List<List<FinancialTransaction>> transactionOfDay;

  const CustomListView({
    super.key,
    required this.transactionOfDay,
  });

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        itemCount: widget.transactionOfDay.length,
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          final int reversedIndex = widget.transactionOfDay.length - 1 - index;
          return ListGroup(
            key: ValueKey(
              widget.transactionOfDay.first.first.amount,
            ),
            transactions: widget.transactionOfDay[reversedIndex],
          );
        },
      ),
    );
  }
}
