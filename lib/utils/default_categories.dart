import 'package:kitty/models/financial_category/financial_category.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/category_icons.dart';

List<FinancialCategory> getDefaultCategories() => [
      FinancialCategory(
        name: AppLocale.grocery,
        colorValue: ColorsApp.lightGreen200,
        iconPath: CategoryIcons.groceries,
        position: 0,
      ),
      FinancialCategory(
        name: AppLocale.gifts,
        colorValue: ColorsApp.pink225,
        iconPath: CategoryIcons.gifts,
        position: 1,
      ),
      // FinancialCategory(
      //   name: AppLocale.barAndCafe,
      //   colorValue: ColorsApp.yellow255,
      //   iconPath: CategoryIcons.bar,
      //   position: 2,
      // ),
      // FinancialCategory(
      //   name: AppLocale.health,
      //   colorValue: ColorsApp.pink248,
      //   iconPath: CategoryIcons.health,
      //   position: 3,
      // ),
      // FinancialCategory(
      //   name: AppLocale.commute,
      //   colorValue: ColorsApp.lightBlue178,
      //   iconPath: CategoryIcons.transportation,
      //   position: 4,
      // ),
      // FinancialCategory(
      //   name: AppLocale.electronics,
      //   colorValue: ColorsApp.pink255,
      //   iconPath: CategoryIcons.electronics,
      //   position: 5,
      // ),
      // FinancialCategory(
      //   name: AppLocale.laundry,
      //   colorValue: ColorsApp.lightBlue179,
      //   iconPath: CategoryIcons.laundry,
      //   position: 6,
      // ),
      // FinancialCategory(
      //   name: AppLocale.liquor,
      //   colorValue: ColorsApp.lightGreen220,
      //   iconPath: CategoryIcons.liquor,
      //   position: 7,
      // ),
      // FinancialCategory(
      //   name: AppLocale.restaurant,
      //   colorValue: ColorsApp.lightSlateBlue197,
      //   iconPath: CategoryIcons.restaurant,
      //   position: 8,
      // ),
      // FinancialCategory(
      //   name: AppLocale.salary,
      //   colorValue: ColorsApp.peach255,
      //   iconPath: CategoryIcons.money,
      //   position: 9,
      // ),
      // FinancialCategory(
      //   name: AppLocale.wages,
      //   colorValue: ColorsApp.yellow255249,
      //   iconPath: CategoryIcons.donate,
      //   position: 10,
      // ),
      // FinancialCategory(
      //   name: AppLocale.interest,
      //   colorValue: ColorsApp.orange255,
      //   iconPath: CategoryIcons.interest,
      //   position: 11,
      // ),
      // FinancialCategory(
      //   name: AppLocale.savings,
      //   colorValue: ColorsApp.lightSlateBlue197,
      //   iconPath: CategoryIcons.savings,
      //   position: 12,
      // ),
      // FinancialCategory(
      //   name: AppLocale.allowance,
      //   colorValue: ColorsApp.lightGreen220,
      //   iconPath: CategoryIcons.money,
      //   position: 13,
      // ),
    ];
