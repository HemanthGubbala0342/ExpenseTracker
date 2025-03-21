import 'package:expensetracker/Model/model.dart';
import 'package:expensetracker/Pages/categoryitems_page.dart';
import 'package:expensetracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';


class CategorydetailsPage extends StatelessWidget {
  final String monthYear;
  final List<Expense> expenses;
  const CategorydetailsPage({
    super.key,
    required this.monthYear,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    Map<String, int> categorizedTotals = {};
    for (var expense in expenses) {
      final category = expense.category;
      final amount = (expense.amount as num).toInt();
      if (!categorizedTotals.containsKey(category)) {
        categorizedTotals[category] = 0;
      }
      categorizedTotals[category] = categorizedTotals[category]! + amount;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          monthYear,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categorizedTotals.length,
        itemBuilder: (context, index) {
          final category = categorizedTotals.keys.elementAt(index);
          final totalAmount = categorizedTotals[category]!;
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
                  Row(
                    children: [
                      Text(t.category),
                      Text(
                        " : $category",
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(t.total_Amount),
                      Text(
                        " : ${totalAmount}rs",
                      ),
                    ],
                  ),
                ],
              ),
              trailing: IconButton(
                onPressed: () {
                  final filteredExpenses = expenses
                      .where((expense) => expense.category == category)
                      .toList();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CategoryitemsPage(
                          category: category,
                          expenses: filteredExpenses,
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
        },
      ),
    );
  }
}
