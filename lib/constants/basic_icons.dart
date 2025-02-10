import 'package:flutter_svg/svg.dart';
import 'package:kitty/data/models/icon.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';

class BasicIcons {
  static final List<IconModel> _basicIcons = [
    IconModel(
      iconPath: CategoryIcons.groceries,
      color: ColorsApp.lightGreen200,
    ),
    IconModel(
      iconPath: CategoryIcons.gifts,
      color: ColorsApp.pink225,
    ),
    IconModel(
      iconPath: CategoryIcons.bar,
      color: ColorsApp.yellow255,
    ),
    IconModel(
      iconPath:CategoryIcons.health,
      color: ColorsApp.pink248,
    ),
    IconModel(
      iconPath: CategoryIcons.transportation,
      color: ColorsApp.lightBlue178,
    ),
    IconModel(
      iconPath: CategoryIcons.laundry,
      color: ColorsApp.lightBlue179,
    ),
    IconModel(
      iconPath: CategoryIcons.liquor,
      color: ColorsApp.lightGreen220,
    ),
    IconModel(
      iconPath: CategoryIcons.restaurant,
      color: ColorsApp.lightSlateBlue197,
    ),
    IconModel(
      iconPath:CategoryIcons.money,
      color: ColorsApp.peach255,
    ),
    IconModel(
      iconPath: CategoryIcons.donate,
      color: ColorsApp.yellow255249,
    ),
    IconModel(
      iconPath: CategoryIcons.interest,
      color: ColorsApp.orange255,
    ),
    IconModel(
      iconPath: CategoryIcons.savings,
      color: ColorsApp.yellow255,
    ),
    IconModel(
      iconPath: CategoryIcons.money,
      color: ColorsApp.lightGreen200,
    ),
    IconModel(
      iconPath: CategoryIcons.party,
      color: ColorsApp.lightBlue187,
    ),
    IconModel(
      iconPath:CategoryIcons.fuel,
      color: ColorsApp.lightBrown215,
    ),
    IconModel(
      iconPath: CategoryIcons.maintenance,
      color: ColorsApp.purple179,
    ),
    IconModel(
      iconPath: CategoryIcons.education,
      color: ColorsApp.lightGreen200,
    ),
    IconModel(
      iconPath: CategoryIcons.selfDevelopment,
      color: ColorsApp.grey207,
    ),
    IconModel(
      iconPath: CategoryIcons.sport,
      color: ColorsApp.yellowGreen230,
    ),
  ];

  List<IconModel> getIcons() {
    return _basicIcons;
  }

  IconModel getIcon(int index) {
    return _basicIcons[index];
  }
}
