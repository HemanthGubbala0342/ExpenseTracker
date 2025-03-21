import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/Model/model.dart';
import 'package:expensetracker/Pages/categorydetails_page.dart';
import 'package:expensetracker/Services/providers.dart';
import 'package:expensetracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class MonthlyexpensePage extends ConsumerWidget {
  const MonthlyexpensePage({super.key});

  String getMonthYear(Timestamp timestamp) {
    return DateFormat('MMMM yyyy').format(timestamp.toDate());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expensesStream = ref.watch(expenseProvider.notifier).getExpense();
    return Scaffold(
      appBar: AppBar(
        title: Text(t.monthly_expense),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: expensesStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final expenses = snapshot.data!;
          Map<String, List<Expense>> monthlyExpenses = {};
          for (var expense in expenses) {
            final monthYear = getMonthYear(expense.date);
            if (!monthlyExpenses.containsKey(monthYear)) {
              monthlyExpenses[monthYear] = [];
            }
            monthlyExpenses[monthYear]!.add(expense);
          }
          return ListView(
            children: monthlyExpenses.entries.map((entry) {
              final month = entry.key;
              final monthExpense = entry.value;
              final monthlyTotal = monthExpense.fold(
                  0,
                  // ignore: avoid_types_as_parameter_names
                  (sum, item) => sum + (item.amount));
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 5,
                  top: 10,
                  right: 15,
                  left: 15,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(t.month_and_year),
                          Text(
                            " $month",
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Text(t.total_Amount),
                          Text(
                            " : ${monthlyTotal}rs",
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CategorydetailsPage(
                              monthYear: month,
                              expenses: monthExpense,
                            );
                          },
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
