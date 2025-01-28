import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/services/localization/app_locale.dart';
import 'package:kitty/model/financial_category.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';

class CategoryService {

  final List<FinancialCategory> _categories = [
    FinancialCategory(
      AppLocale.grocery,
      ColorsApp.lightGreen200,
      SvgPicture.asset(CategoryIcons.groceries),
    ),
    FinancialCategory(
      AppLocale.gifts,
      ColorsApp.pink225,
      SvgPicture.asset(CategoryIcons.gifts),
    ),
    FinancialCategory(
      AppLocale.barAndCafe,
      ColorsApp.yellow255,
      SvgPicture.asset(CategoryIcons.bar),
    ),
    FinancialCategory(
      AppLocale.health,
      ColorsApp.pink248,
      SvgPicture.asset(CategoryIcons.health),
    ),
    FinancialCategory(
      AppLocale.commute,
      ColorsApp.lightBlue178,
      SvgPicture.asset(CategoryIcons.transportation),
    ),
    FinancialCategory(
      AppLocale.electronics,
      ColorsApp.pink255,
      SvgPicture.asset(CategoryIcons.electronics),
    ),
    FinancialCategory(
      AppLocale.laundry,
      ColorsApp.lightBlue179,
      SvgPicture.asset(CategoryIcons.laundry),
    ),
    FinancialCategory(
      AppLocale.liquor,
      ColorsApp.lightGreen220,
      SvgPicture.asset(CategoryIcons.liquor),
    ),
    FinancialCategory(
      AppLocale.restaurant,
      ColorsApp.lightSlateBlue197,
      SvgPicture.asset(CategoryIcons.restaurant),
    ),
    FinancialCategory(
      AppLocale.salary,
      ColorsApp.peach255,
      SvgPicture.asset(CategoryIcons.money),
    ),
    FinancialCategory(
      AppLocale.wages,
      ColorsApp.yellow255249,
      SvgPicture.asset(CategoryIcons.donate),
    ),
    FinancialCategory(
      AppLocale.interest,
      ColorsApp.orange255,
      SvgPicture.asset(CategoryIcons.interest),
    ),
    FinancialCategory(
      AppLocale.savings,
      ColorsApp.lightSlateBlue197,
      SvgPicture.asset(CategoryIcons.savings),
    ),
    FinancialCategory(
      AppLocale.allowance,
      ColorsApp.lightGreen200,
      SvgPicture.asset(CategoryIcons.money),
    ),
  ];

  List<FinancialCategory> getCategories() {
    return _categories;
  }

  void addNewCategory(FinancialCategory newCategory) {
    _categories.add(newCategory);
  }

  void removeCategory(int index) {
    _categories.removeAt(index);
  }

  void changePosition(int oldIndex, int newIndex) {
    FinancialCategory item = _categories.removeAt(oldIndex);
    _categories.insert(newIndex, item);
  }
}
