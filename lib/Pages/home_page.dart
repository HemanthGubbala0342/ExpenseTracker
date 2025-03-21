import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/Model/model.dart';
import 'package:expensetracker/Pages/monthlyexpense_page.dart';
import 'package:expensetracker/Services/providers.dart';
import 'package:expensetracker/i18n/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends ConsumerStatefulWidget {
  const Homepage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends ConsumerState<Homepage> {
  String formatTimestamp(Timestamp timestamp) {
    final DateTime dateTime = timestamp.toDate();
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  void saveLocale(AppLocale locale) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.app_title),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: DropdownButton(
            dropdownColor: Theme.of(context).colorScheme.secondary,
            value: LocaleSettings.currentLocale,
            items: [
              DropdownMenuItem(
                value: AppLocale.en,
                child: Text(
                  "en",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: AppLocale.es,
                child: Text(
                  "es",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              DropdownMenuItem(
                value: AppLocale.te,
                child: Text(
                  "te",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ],
            onChanged: (value) {
              AppLocale newLocale = value as AppLocale;
              LocaleSettings.setLocale(newLocale);
              saveLocale(newLocale);
            },
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const MonthlyexpensePage();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.calendar_month,
            ),
          ),
        ],
      ),
      body: StreamBuilder<List<Expense>>(
        stream: ref.read(expenseProvider.notifier).getExpense(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final expenses = snapshot.data!;
          return ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              final expense = expenses[index];
              return Slidable(
                startActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        editExpense(context, ref, expense);
                      },
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Theme.of(context).colorScheme.surface,
                      spacing: 4,
                      icon: Icons.edit,
                      label: t.slidable_editButton,
                      borderRadius: BorderRadius.circular(10),
                    )
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {
                        ref
                            .read(expenseProvider.notifier)
                            .deleteExpense(expense.id);
                      },
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      foregroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      spacing: 4,
                      icon: Icons.delete,
                      label: t.slidable_deleteButton,
                      borderRadius: BorderRadius.circular(10),
                    )
                  ],
                ),
                child: Container(
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
                            Text(t.name),
                            Text(
                              " : ${expense.name}",
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(t.category),
                            Text(
                              " : ${expense.category}",
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(t.amount),
                            Text(
                              " : ${expense.amount}rs",
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(t.payment_date),
                            Text(
                              " : ${formatTimestamp(expense.date)}",
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(t.created_at),
                            Text(
                              " : ${formatTimestamp(expense.createdAt)}",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8, bottom: 35),
        child: FloatingActionButton(
          onPressed: () {
            addNewExpenseTask(context, ref);
          },
          child: const Icon(
            Icons.edit,
          ),
        ),
      ),
    );
  }

  void addNewExpenseTask(BuildContext context, WidgetRef ref) async {
    TextEditingController dateandtimeController = TextEditingController(
        text:
            "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}");
    String name = '';
    String category = '';
    int amount = 0;
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.add_expense),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: t.recipient_name),
                onChanged: (value) {
                  name = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: t.category),
                onChanged: (value) {
                  category = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: t.amount),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  amount = int.tryParse(value) ?? 0;
                },
              ),
              GestureDetector(
                onTap: () async {
                  DateTime? dateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDate: selectedDate,
                  );
                  if (dateTime != null && dateTime != selectedDate) {
                    selectedDate = dateTime;
                    dateandtimeController.text =
                        "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(labelText: t.select_a_Date),
                    controller: dateandtimeController,
                  ),
                ),
              )
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(t.cancel),
          ),
          TextButton(
            onPressed: () {
              if (name.isNotEmpty && category.isNotEmpty && amount > 0) {
                ref.read(expenseProvider.notifier).addExpense(
                      name,
                      category,
                      amount,
                      Timestamp.fromDate(selectedDate),
                    );
              }
              Navigator.pop(context);
            },
            child: Text(t.save),
          ),
        ],
      ),
    );
  }

  Future<void> editExpense(
      BuildContext context, WidgetRef ref, Expense expense) async {
    TextEditingController dateandtimeController = TextEditingController(
      text:
          "${expense.date.toDate().day}/${expense.date.toDate().month}/${expense.date.toDate().year}",
    );
    String name = expense.name;
    String category = expense.category;
    int amount = expense.amount;
    DateTime selectedDate = expense.date.toDate();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(t.update_expense),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: t.recipient_name),
                onChanged: (value) {
                  name = value;
                },
                controller: TextEditingController(text: name),
              ),
              TextField(
                decoration: InputDecoration(labelText: t.category),
                onChanged: (value) {
                  category = value;
                },
                controller: TextEditingController(text: category),
              ),
              TextField(
                decoration: InputDecoration(labelText: t.amount),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  amount = int.tryParse(value) ?? amount;
                },
                controller: TextEditingController(text: amount.toString()),
              ),
              GestureDetector(
                onTap: () async {
                  DateTime? dateTime = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    initialDate: selectedDate,
                  );
                  if (dateTime != null) {
                    selectedDate = dateTime;
                    dateandtimeController.text =
                        "${dateTime.day}/${dateTime.month}/${dateTime.year}";
                  }
                },
                child: AbsorbPointer(
                  child: TextField(
                    decoration: InputDecoration(labelText: t.select_a_Date),
                    controller: dateandtimeController,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(t.cancel),
          ),
          TextButton(
            onPressed: () {
              if (name.isNotEmpty && category.isNotEmpty && amount > 0) {
                ref.read(expenseProvider.notifier).updateExpense(
                      expense.id,
                      name,
                      category,
                      amount,
                      Timestamp.fromDate(selectedDate),
                    );
              }
              Navigator.pop(context);
            },
            child: Text(t.save),
          ),
        ],
      ),
    );
  }
}
