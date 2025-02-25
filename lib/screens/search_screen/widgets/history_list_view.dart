import 'package:flutter/material.dart';
import 'package:kitty/screens/search_screen/widgets/search_history_row.dart';

class HistoryListView extends StatefulWidget {
  final Function? onTap;
  final Function? onDissmissed;

  const HistoryListView({
    super.key,
    required this.searchHistory,
    this.onTap,
    this.onDissmissed,
  });

  final List<String> searchHistory;

  @override
  State<HistoryListView> createState() => _HistoryListViewState();
}

class _HistoryListViewState extends State<HistoryListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 20.0,
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 12.0,
        ),
        itemCount: widget.searchHistory.length,
        itemBuilder: (context, index) {
          return SearchHistoryRow(
            name: widget.searchHistory[index],
            onTap: widget.onTap,
            onDissmissed:(name){ 
              if (widget.onDissmissed != null) {
                widget.onDissmissed!(name);
              }
            },
          );
        },
      ),
    );
  }
}
