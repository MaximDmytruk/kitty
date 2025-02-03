import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kitty/cubits/date_cubit/date_cubit.dart';
import 'package:kitty/localization/app_locale.dart';

import '../../styles/colors/colors_app.dart';
import '../../styles/font/fontstyle_app.dart';
import '../../styles/icons/icons_app.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({super.key});

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  OverlayEntry? _overlayEntry;

  late int selectedMonth;
  late int selectedYear;

  Map<int, String> months = {
    1: 'January',
    2: 'February',
    3: 'March',
    4: 'April',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'August',
    9: 'September',
    10: 'October',
    11: 'November',
    12: 'December',
  };

  @override
  void initState() {
    selectedMonth = context.read<DateCubit>().getMonth();
    selectedYear = context.read<DateCubit>().getYear();
    super.initState();
  }

  void datePickerAction() {
    _toggleOverlay();
  }

  void _rightDateAction(BuildContext context) {
    context.read<DateCubit>().nextYear();
  }

  void _leftDateAction(BuildContext context) {
    context.read<DateCubit>().previousYear();
  }

  void _monthPicked(BuildContext context, int indexOfMonth) {
   
      print(indexOfMonth);
      context.read<DateCubit>().selectMonth(newNumOfMonth: indexOfMonth);
    

    _toggleOverlay();
    setState(() {});
  }

  void _toggleOverlay() {
    if (_overlayEntry == null) {
      _showOverlay();
    } else {
      _hideOverlay();
    }
  }

  void _showOverlay() {
    OverlayState overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(
            top: 150.0,
            left: 24.0,
            right: 24.0,
            bottom: 480.0,
          ),
          child: BlocBuilder<DateCubit, DateState>(
            builder: (context, state) {
              return Material(
                shadowColor: Colors.transparent,
                child: Container(
                  // height: 300,
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                        ),
                        child: Text(
                          AppLocale.pickMonth.getString(context),
                          style: interTextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: ColorsApp.grey66,
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 40.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 2.0,
                          ),
                          itemCount: months.length,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: ColorsApp.white,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      color: ColorsApp.lightGrey224,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      months.values.elementAt(index),
                                      style: interTextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: ColorsApp.black,
                                      ),
                                    ),
                                  ),
                                ),
                                Material(
                                  shadowColor: Colors.transparent,
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4.0),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(4.0),
                                    splashColor:
                                        ColorsApp.blue123.withAlpha(200),
                                    highlightColor:
                                        ColorsApp.blue123.withAlpha(200),
                                    onTap: () {
                                      _monthPicked(context, index+1);
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );

    overlayState.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateCubit, DateState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => _leftDateAction(context),
              icon: SvgPicture.asset(
                IconsApp.left,
                width: 24.0,
                height: 24.0,
              ),
            ),
            ElevatedButton(
                onPressed: datePickerAction,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    ColorsApp.lightGrey245,
                  ),
                  foregroundColor: WidgetStatePropertyAll(
                    ColorsApp.grey66,
                  ),
                  elevation: WidgetStatePropertyAll(0.0),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      IconsApp.calendar,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '${months[state.selectedMonth]} , ${state.selectedYear}',
                      style: interTextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: ColorsApp.grey66,
                      ),
                    )
                  ],
                )),
            IconButton(
              onPressed: () => _rightDateAction(context),
              icon: SvgPicture.asset(
                IconsApp.right,
                width: 24.0,
                height: 24.0,
              ),
            ),
          ],
        );
      },
    );
  }
}
