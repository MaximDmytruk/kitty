import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/blocs/date_cubit/date_cubit.dart';
import 'package:kitty/blocs/fin_category_cubit/fin_category_cubit.dart';
import 'package:kitty/blocs/fin_transaction_cubit/fin_transaction_cubit.dart';
import 'package:kitty/blocs/user_cubit/user_cubit.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/screens/add_new_transaction/add_new_transaction_screen.dart';
import 'package:kitty/widgets/list_views/custom_list_view.dart';
import 'package:kitty/screens/home_screen/widgets/total_amount.dart';
import 'package:kitty/screens/search_screen/screen/search_screen.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/utils/filteredTransactionsByDay.dart';
import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';
import '../../../widgets/date_picker/custom_date_picker.dart';
import '../../../widgets/app_bars/custom_home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String firstChar;

  @override
  void initState() {
    super.initState();
    context.read<FinCategoryCubit>().getFinancialCategories();
    context.read<FinTransactionCubit>().getTransactions();
    firstChar = context.read<UserCubit>().getFirstLetterName();
  }

  void searchAction() => Navigator.of(context).pushNamed(
        SearchScreen.routeName,
      );

  void addNewAction() => Navigator.of(context).pushNamed(
        AddNewTransactionScreen.routeName,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Column(
            children: [
              CustomStatusBar(),
              CustomHomeAppBar(
                firstLetter: firstChar,
                searchAction: searchAction,
              ),
              CustomDatePicker(),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                  left: 16.0,
                  right: 16.0,
                ),
                child: TotalAmount(),
              ),
              BlocBuilder<DateCubit, DateState>(
                builder: (
                  context,
                  stateDate,
                ) {
                  return BlocBuilder<FinTransactionCubit, FinTransactionState>(
                    builder: (
                      context,
                      stateTransactions,
                    ) {
                      context.read<FinTransactionCubit>().getTransactions(
                            dateMonth: stateDate.selectedMonth,
                            year: stateDate.selectedYear,
                          );
                      List<List<FinancialTransaction>> transactionOfDay = [];
                      transactionOfDay = filteredTransactionsByDay(
                        stateTransactions.transactions ?? [],
                      );

                      return CustomListView(
                        transactionOfDay: transactionOfDay,
                      );
                    },
                  );
                },
              ),
            ],
          ),
          //Button AddNew
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16.0,
            ),
            child: CustomFeeledButton(
              onPressed: addNewAction,
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
