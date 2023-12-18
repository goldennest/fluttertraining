import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:wallet_app/theme.dart';
import 'package:wallet_app/transaction_model.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  double balance = 0.0;
  TextEditingController amountController = TextEditingController();
  List<Transaction> transactionHistory = [];

  @override
  void initState() {
    super.initState();
    loadBalance();
    loadTransactionHistory();
  }

  void resetTransactionHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      balance = 0.0;
      transactionHistory.clear();
      amountController.clear();
    });
    prefs.remove('balance');
    prefs.remove('transactionHistory');
  }

  void loadBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      balance = prefs.getDouble('balance') ?? 0.0;
    });
  }

  void loadTransactionHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String>? withdrawalList = prefs.getStringList('transactionHistory');

    if (withdrawalList != null) {
      setState(() {
        transactionHistory = withdrawalList
            .map((withdrawal) => Transaction.fromJson(withdrawal))
            .toList();
            transactionHistory.sort((a, b) => b.time.compareTo(a.time));
      });
    }
  }

  void saveBalance(double amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('balance', amount);
  }

  void savetransactionHistory(TransactionType type, double amount) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = Transaction(type, amount: amount, time: DateTime.now());
    transactionHistory.add(data);

    List<String> withdrawalList = transactionHistory
        .map((withdrawal) => jsonEncode(withdrawal.toMap()))
        .toList();
    prefs.setStringList('transactionHistory', withdrawalList);
  }

  void depositMoney(double amount) {
    setState(() {
      balance += amount;
      saveBalance(balance);
      savetransactionHistory(TransactionType.deposit, amount);
      amountController.clear();
    });
  }

  void withdrawMoney(double amount) {
    if (balance >= amount) {
      setState(() {
        balance -= amount;
        saveBalance(balance);
        savetransactionHistory(TransactionType.withdraw, amount);
        amountController.clear();
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Insufficient Balance"),
            content: const Text("You do not have enough balance to withdraw."),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  String _formatTimeDifference(Duration difference) {
    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day ago' : 'days ago'}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour ago' : 'hours ago'}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute ago' : 'minutes ago'}';
    } else {
      return 'just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.brightness_4),
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              ],
              expandedHeight: 100.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Balance: ₹${balance.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 204, 221, 204),
                      Colors.green.shade100
                    ]),
                  ),
                  height: 230,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20.0),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: amountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "Enter Amount",
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (amountController.text.isNotEmpty) {
                                  double amount =
                                      double.parse(amountController.text);
                                  depositMoney(amount);
                                }
                              },
                              child: const Text("Add Fund"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (amountController.text.isNotEmpty) {
                                  double amount =
                                      double.parse(amountController.text);
                                  withdrawMoney(amount);
                                }
                              },
                              child: const Text("Withdraw Fund"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 255, 255, 255),
              Color.fromRGBO(248, 248, 248, 1)
            ]),
            borderRadius:
                BorderRadius.circular(10.0), // Set border radius if needed
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          height: MediaQuery.of(context).size.height,
          child: (transactionHistory.isEmpty)
              ? const Center(child: Text("No Transactions"))
              : ListView.builder(
                  itemCount: transactionHistory.length,
                  itemBuilder: (context, index) {
                    final transaction = transactionHistory[index];
                    final timeDifference =
                        DateTime.now().difference(transaction.time);
                    final formattedTimeDifference =
                        _formatTimeDifference(timeDifference);
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 4,
                          child: ListTile(
                            title: Text(
                              "Withdraw Amount: ₹${transactionHistory[index].amount.toStringAsFixed(2)}",
                            ),
                            subtitle: Text(
                              "Date & Time: ${DateFormat('yyyy-MM-dd HH:mm:ss').format(transactionHistory[index].time)}",
                            ),
                            trailing: Text(
                              "$formattedTimeDifference ",
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Reset Transactions"),
                content: const Text(
                    "Are you sure you want to Delete all transactions?"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      resetTransactionHistory();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Yes"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("No"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
