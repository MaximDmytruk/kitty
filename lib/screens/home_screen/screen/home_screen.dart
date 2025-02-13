import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitty/blocs/date_cubit/date_cubit.dart';
import 'package:kitty/blocs/fin_transaction_cubit/fin_transaction_cubit.dart';
import 'package:kitty/blocs/user_cubit/user_cubit.dart';
import 'package:kitty/localization/app_locale.dart';
import 'package:kitty/models/financial_transaction/financial_transaction.dart';
import 'package:kitty/screens/add_new_transaction/add_new_transaction_screen.dart';
import 'package:kitty/screens/home_screen/widgets/total_amount.dart';
import 'package:kitty/screens/search_screen/screen/search_screen.dart';
import 'package:kitty/styles/colors/colors_app.dart';
import 'package:kitty/styles/icons/icons_app.dart';
import 'package:kitty/widgets/buttons/custom_feeled_button.dart';
import 'package:kitty/widgets/app_bars/custom_status_bar.dart';
import 'package:kitty/widgets/list_group_and_item/list_group.dart';
import '../../../widgets/date_picker/custom_date_picker.dart';
import '../../../widgets/app_bars/custom_home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // static const String routeName = '/home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String firstChar;
  late List<FinancialTransaction> financialTransaction = [];
   
  @override
  void initState() {
    
    firstChar = context.read<UserCubit>().getFirstLetterName();
    // context.read<FinTransactionCubit>().getTransactions(date: );
    
    super.initState();
  }

  void searchAction() =>
      Navigator.of(context).pushNamed(SearchScreen.routeName);

  void addNewAction() => Navigator.of(context)
          .pushNamed(AddNewTransactionScreen.routeName)
          .whenComplete(
        () {
          setState(() {});
        },
      );

  List<FinancialTransaction> filterForTransactions( // фільтрувати з sql !
    List<FinancialTransaction> allTransaction,
  ) {
    int selectedMonth = context.read<DateCubit>().getMonth();
    int selectedYear = context.read<DateCubit>().getYear();

    List<FinancialTransaction> filteredTransactions = allTransaction
        .where(
          (transaction) =>
              transaction.date.month == selectedMonth &&
              transaction.date.year == selectedYear,
        )
        .toList()
        .reversed
        .toList();
        print('FILTEREDTRANSACTIONS IN METHODS');
        print(filteredTransactions);
    return filteredTransactions;
  }

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
              BlocBuilder<FinTransactionCubit, FinTransactionState>(
                builder: (context, stateTransactions) {
                  return BlocBuilder<DateCubit, DateState>(
                    builder: (context, stateDate) {
                      List<FinancialTransaction>? transaction =
                          stateTransactions.transactions;
                          



                      print('TRANSACTION IN HOMESCREEN');
                      print(transaction);
                      List<FinancialTransaction> filteredTransactions = transaction ?? [];

                      if (transaction != null) {
                        filteredTransactions = 
                            filterForTransactions(transaction);
                        print('filteredTransactions IN HOMESCREEN');
                        print(filteredTransactions);
                      }

                      return Expanded(
                        child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          itemCount: filteredTransactions!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListGroup(
                              transactions: filteredTransactions,
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              // BlocBuilder<UserCubit, UserState>(
              //   builder: (context, stateUser) {
              //     return BlocBuilder<DateCubit, DateState>(
              //       builder: (context, stateDate) {
              //         List<FinancialTransaction> filteredTransactions =
              //             filterForTransactions(financialTransaction);
              //         // List<List<FinancialTransaction>> listOfdays = filteredTransactions.where((transaction) =>  day.date.day,)
              //         //TODO: доробити фільтр по дню.

              //         // Map<int, List<FinancialTransaction>> dayListTransactions =
              //         //     {};
              //         // for (FinancialTransaction transaction
              //         //     in filteredTransactions) {
              //         //   int day = transaction.date.day;
              //         //   dayListTransactions[day]?.add(transaction);
              //         // }

              //         return Expanded(
              //           child: ListView.builder(
              //             padding: EdgeInsets.symmetric(
              //               horizontal: 16.0,
              //               vertical: 8.0,
              //             ),
              //             itemCount: filteredTransactions.length,
              //             itemBuilder: (BuildContext context, int index) {
              //               return ListGroup(
              //                 transactions: filteredTransactions,
              //               );
              //             },
              //           ),
              //         );
              //       },
              //     );
              //   },
              // ),
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
