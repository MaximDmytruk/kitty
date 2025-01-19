import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/screens/add_new_screen/add_new_screen.dart';
import 'package:kitty/screens/home_screen/widgets/total_amount.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/custom_feeled_button.dart';
import 'package:kitty/widgets/custom_status_bar.dart';
import 'package:kitty/widgets/list_group.dart';
import '../../../widgets/custom_date_picker_app_bar.dart';
import '../../../widgets/custom_home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ListGroup> _listGroups = [
    ListGroup(),
    ListGroup(),
    ListGroup(),
    ListGroup(),
  ];

  void searchAction() {}
  void userAction() {}
  void leftDateAction() {}
  void rightDateAction() {}
  void datePickerAction() {}
  void addNew() => Navigator.of(context).pushNamed(AddNewScreen.routeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KittyColors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              CustomStatusBar(),
              CustomHomeAppBar(
                searchAction: searchAction,
                userAction: userAction,
              ),
              CustomDatePickerAppBar(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: TotalAmount(),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return _listGroups[index];
                  },
                  itemCount: _listGroups.length,
                ),
              ),
            ],
          ),
          //Button AddNew
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: CustomFeeledButton(
              onPressed: addNew,
              name: AppLocale.addNew.getString(context),
              icon: SvgPicture.asset(
                IconsApp.addPlusCircle,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 6.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
