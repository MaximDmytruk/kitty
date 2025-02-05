import 'package:flutter_svg/svg.dart';
import 'package:kitty/models/icon.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';

class BasicIcons {
  static final List<IconModel> _basicIcons = [
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.groceries),
      color: ColorsApp.lightGreen200,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.gifts),
      color: ColorsApp.pink225,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.bar),
      color: ColorsApp.yellow255,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.health),
      color: ColorsApp.pink248,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.transportation),
      color: ColorsApp.lightBlue178,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.laundry),
      color: ColorsApp.lightBlue179,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.liquor),
      color: ColorsApp.lightGreen220,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.restaurant),
      color: ColorsApp.lightSlateBlue197,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.money),
      color: ColorsApp.peach255,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.donate),
      color: ColorsApp.yellow255249,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.interest),
      color: ColorsApp.orange255,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.savings),
      color: ColorsApp.yellow255,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.money),
      color: ColorsApp.lightGreen200,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.party),
      color: ColorsApp.lightBlue187,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.fuel),
      color: ColorsApp.lightBrown215,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.maintenance),
      color: ColorsApp.purple179,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.education),
      color: ColorsApp.lightGreen200,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.selfDevelopment),
      color: ColorsApp.grey207,
    ),
    IconModel(
      icon: SvgPicture.asset(CategoryIcons.sport),
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
