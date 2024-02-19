import 'package:financial_app/model/income_item.dart';
import 'package:financial_app/model/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OperationsPage extends StatefulWidget {
  const OperationsPage(
      {super.key, required this.incomes, required this.expenses});
  final List<IncomeItem> incomes;
  final List<ExpenseItem> expenses;

  @override
  State<OperationsPage> createState() => _OperationsPageState();
}

class _OperationsPageState extends State<OperationsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(18, 65, 18, 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Operations',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              if (widget.incomes.isNotEmpty || widget.expenses.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      height: 43,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 5,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          color: const Color(0xFFebe7ef),
                        ),
                        child: TabBar(
                          padding: const EdgeInsets.all(2),
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                            color: Colors.white,
                          ),
                          tabs: const [
                            Tab(
                              text: 'Incomes',
                            ),
                            Tab(
                              text: 'Expenses',
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: TabBarView(
                  children: [
                    widget.incomes.isNotEmpty
                        ? SingleChildScrollView(
                            child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: getIncomes(),
                          ))
                        : widget.expenses.isNotEmpty
                            ? const Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 68, vertical: 200),
                                        child: Text(
                                          'Add your incomes to track your history',
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : const SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 68, vertical: 200),
                                      child: Text(
                                        'Add your expenses and incomes to track your history',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                    widget.expenses.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: getExpenses(),
                          )
                        : widget.incomes.isNotEmpty
                            ? const SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 68, vertical: 200),
                                      child: Text(
                                        'Add your expenses to track your history',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : const SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 68, vertical: 200),
                                      child: Text(
                                        'Add your expenses and incomes to track your history',
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getExpenses() {
    List<Widget> list = [];
    for (var expense in widget.expenses) {
      list.add(Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        decoration: BoxDecoration(
            color: const Color(0xFFebe7ef),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                '-\$ ${expense.cost!.toStringAsFixed(0)}',
                style: const TextStyle(
                    color: Color(0xFFAA69DE),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${expense.description}',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  DateFormat("MM/dd/yyyy").format(expense.date!),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ));
    }
    return Column(
      children: list,
    );
  }

  Widget getIncomes() {
    List<Widget> list = [];
    for (var income in widget.incomes) {
      list.add(Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
        decoration: BoxDecoration(
            color: const Color(0xFFebe7ef),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                '+\$ ${income.cost!.toStringAsFixed(0)}',
                style: const TextStyle(
                    color: Color(0xFFAA69DE),
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${income.description}',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  DateFormat("MM/dd/yyyy").format(income.date!),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      ));
    }
    return Column(
      children: list,
    );
  }
}
