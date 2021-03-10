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

  void addTransaction(String newTitle, String newCost) {
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
  }

  void deleteTransaction(String id) {
    setState(
      () => {transactions = transactions.where((e) => e.id != id).toList()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("App Bar"),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            height: 727,
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    children: [
                      AddTransaction(addTransaction),
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
