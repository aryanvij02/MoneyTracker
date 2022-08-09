import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function(String, double) addNewTransaction;

  //TO RECEIVE DATA IN A WIDGET FROM OUTSIDE, YOU MUST ACCEPT IT IN THE CONSTRUCTOR OF THE WIDGET AND NOT THE STATE
  NewTransaction({super.key, required this.addNewTransaction});

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return; //A return statement actually stops the execution of the code after it inside of the function, hence if this 'if' statement runs and returns, the subsequent lines of code would not run
    }
    widget.addNewTransaction(
      //widget. enabled the state class to access the variables inside of the connected class.
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop(); //Closes the top most layer of the widget stack
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              //onChanged: (value) => amountInput = value,,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_val) =>
                  submitData(), //onSubmitted gives us a String value, hence we have to create this anonymous function, but we don't do anything with the value
            ),
            TextButton(
              onPressed: submitData,
              child: const Text(
                "Add Transaction",
                style: TextStyle(color: Colors.purple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
