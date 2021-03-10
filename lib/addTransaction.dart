import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  final Function addTransaction;

  AddTransaction(this.addTransaction);

  @override
  AddTransactionState createState() => AddTransactionState(addTransaction);
}

class AddTransactionState extends State<AddTransaction> {
  final Function addTransaction;

  AddTransactionState(this.addTransaction);

  final titleController = TextEditingController();
  final costController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Container(
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Item",
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 150,
                    child: TextField(
                      controller: costController,
                      decoration: InputDecoration(
                        labelText: "Cost",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(55, 12, 0, 0),
                    width: 100,
                    child: FlatButton(
                      onPressed: () {
                        addTransaction(
                            titleController.text, costController.text);
                      },
                      child: Text("Add"),
                      color: Colors.blue[50],
                      hoverColor: Colors.blue[200],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
