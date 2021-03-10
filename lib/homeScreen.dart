import 'package:expenses_app/types.dart';
import 'package:flutter/material.dart';

import 'addTransaction.dart';
import 'transactionOverview.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<Transaction> transactions = [];
  bool showAddExpenseModal = false;

  bool addTransaction(String newTitle, String newCost) {
    try {
      final cost = double.parse(newCost);
      if (newTitle.isEmpty) {
        throw "No input provided";
      }
      if (cost <= 0) {
        throw "Provide a positive cost";
      }
      setState(
        () => {
          transactions = [
            ...transactions,
            Transaction(
              id: transactions.length.toString(),
              title: newTitle,
              amount: double.parse(newCost),
              date: DateTime.now(),
            )
          ],
        },
      );

      return true;
    } catch (error) {
      print("Error caught: $error");
      return false;
    }
  }

  void deleteTransaction(String id) {
    setState(
      () => {transactions = transactions.where((e) => e.id != id).toList()},
    );
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return AddTransaction(addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Bar"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              startAddNewTransaction(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[200],
          height: 720,
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      height: 550,
                      child: ListView.builder(
                        itemBuilder: (buildContext, index) {
                          return TransactionOverview(
                            transactions[index],
                            deleteTransaction,
                          );
                        },
                        itemCount: transactions.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: showAddExpenseModal ? Icon(Icons.remove) : Icon(Icons.add),
        onPressed: () {
          startAddNewTransaction(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
