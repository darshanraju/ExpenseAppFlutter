import 'package:expenses_app/types.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionOverview extends StatelessWidget {
  Transaction transaction;
  Function deleteTransaction;

  TransactionOverview(this.transaction, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            child: Text(
              "\$${transaction.amount.toString()}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue[200],
              ),
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${transaction.id} ${transaction.title}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              Text(
                DateFormat.yMMMd().format(transaction.date),
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[850],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  deleteTransaction(transaction.id);
                },
                alignment: Alignment.centerRight,
              ),
            ],
          )
        ],
      ),
    );
  }
}
