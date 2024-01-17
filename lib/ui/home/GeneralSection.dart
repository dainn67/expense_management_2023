import 'package:flutter/material.dart';
import 'package:learnflutterapp/common/widgets/CommonWidgets.dart';

class GeneralTab extends StatefulWidget {
  final double balance;
  final double walletBalance;
  final double bankBalance;
  final double stockBalance;

  const GeneralTab(
      {super.key,
      required this.balance,
      required this.walletBalance,
      required this.bankBalance,
      required this.stockBalance});

  @override
  State<GeneralTab> createState() => _GeneralTabState();
}

class _GeneralTabState extends State<GeneralTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.lightBlueAccent,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(3, 3))
          ]),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.24,
      margin: const EdgeInsets.all(18.0),
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Image.asset("assets/total_balance.png")),
                  const Text("BALANCE",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(getDisplayCurrency(widget.balance),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.055)),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(3, 3))
                  ]),
              child: Column(
                children: [
                  sourceBalance("Wallet", 1000000),
                  sourceBalance("Bank", 2000000),
                  sourceBalance("Stock", 3000000),
                  sourceBalance("Saving", 4000000)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget sourceBalance(String name, double money) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.025,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.15,
            child: Text(name,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
          ),
          Text(getDisplayCurrency(money),
              style: const TextStyle(color: Colors.white, fontSize: 15)),
        ],
      ),
    );
  }
}
