import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionClickHandler;
  NewTransaction(this.addTransactionClickHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountCountroller = TextEditingController();

  void submitHandler() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountCountroller.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
    widget.addTransactionClickHandler(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.only(right: 10, left: 10),
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submitHandler(),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountCountroller,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => submitHandler(),
              ),
              FlatButton(
                child: Text("Add Transaction"),
                textColor: Colors.purple,
                onPressed: submitHandler,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
