import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment UI',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.white,
        brightness: Brightness.light,
      ),
      home: PaymentForm(),
    );
  }
}

class PaymentForm extends StatefulWidget {
  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {
  final _formKey = GlobalKey<FormState>();
  late String _cardHolderName;
  late String _cardNumber;
  late String _expiryDate;
  late String _cvv;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Card Holder Name',
              labelStyle: TextStyle(color: Theme.of(context).accentColor),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
            onSaved: (value) => _cardHolderName = value!,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Card Number',
              labelStyle: TextStyle(color: Theme.of(context).accentColor),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your card number';
              }
              return null;
            },
            onSaved: (value) => _cardNumber = value!,
            style: TextStyle(color: Theme.of(context).accentColor),
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Expiry Date',
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the expiry date';
                    }
                    return null;
                  },
                  onSaved: (value) => _expiryDate = value!,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'CVV',
                    labelStyle: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the CVV';
                    }
                    return null;
                  },
                  onSaved: (value) => _cvv = value!,
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
              ),
            ],
          ),
          // RaisedButton(
          //   onPressed: () {
          //     if (_formKey.currentState.validate()) {
          //       _formKey.currentState.save();
          //       // Process the payment here
          //     }
          //   },
          //   color: Theme.of(context).accentColor,
          //   child: Text('Pay', style: TextStyle(color: Theme.of(context).primaryColor)),
          // ),
        ],
      ),
    );
  }
}

