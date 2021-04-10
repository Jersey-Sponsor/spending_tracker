import 'package:flutter/material.dart';
import 'package:spending_tracker/widgets/add_transaction_form.dart';
import 'package:spending_tracker/widgets/balance_banner.dart';
import 'package:spending_tracker/widgets/transactions_table.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spending tracker',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    const headerHeight = 120.0;
    var contentWidth = MediaQuery.of(context).size.width * 0.8;
    var contentMarginHorizontal =
        MediaQuery.of(context).size.width - contentWidth;
    var contentMarginVertical = 20.0;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          toolbarHeight: headerHeight,
          actions: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
          title: Container(
            padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
            width: contentWidth,
            height: headerHeight,
            child: Text(
              "Welcome back,\nMarcos",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 30,
                color: Colors.black,
              ),
            ),
          )),
      body: SizedBox.expand(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: contentMarginVertical,
              ),
              Text(
                "Balance",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: contentMarginVertical,
              ),
              BalanceBanner(),
              SizedBox(
                height: contentMarginVertical,
              ),
              Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: contentMarginVertical,
              ),
              TransactionsTable(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return AddTransactionForm();
              });
        },
        backgroundColor: Color(0xFF5BC8AA),
        child: Icon(Icons.add),
      ),
    );
  }
}
