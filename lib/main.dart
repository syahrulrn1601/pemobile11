import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart.dart';
import 'money.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<Money>(
            builder: (context) => Money(),
          ),
          ChangeNotifierProvider<Cart>(
            builder: (context) => Cart(),
          )
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) => Consumer<Cart>(
              builder: (context, cart, _) => FloatingActionButton(
                onPressed: () {
                  if (money.balance >= 500) {
                    cart.quantity += 1;
                    money.balance -= 500;
                  }
                },
                child: Icon(Icons.add_shopping_cart),
                backgroundColor: Colors.purple,
              ),
            ),
          ),
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text("Pertemuan 11"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Balance"),
                    Container(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Money>(
                          builder: (context, money, _) => Text(
                            money.balance.toString(),
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      height: 30,
                      width: 150,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.purple[100],
                          border: Border.all(color: Colors.purple, width: 2)),
                    )
                  ],
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Consumer<Cart>(
                      builder: (context, cart, _) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Mangga (500) x " + cart.quantity.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            (500 * cart.quantity).toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height: 30,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 2)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EdgeInsert {}
