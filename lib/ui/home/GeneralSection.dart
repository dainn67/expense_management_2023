import 'package:flutter/material.dart';
import 'package:learnflutterapp/common/widgets/CommonWidgets.dart';

class GeneralSection extends StatefulWidget {
  final double balance;
  final double walletBalance;
  final double bankBalance;
  final double stockBalance;

  const GeneralSection(
      {super.key,
      required this.balance,
      required this.walletBalance,
      required this.bankBalance,
      required this.stockBalance});

  @override
  State<GeneralSection> createState() => _GeneralSectionState();
}

class _GeneralSectionState extends State<GeneralSection> {
  bool isDropdown = false;
  bool isHidden = true;

  double size = 500;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      curve: Curves.easeInOut,
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
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      child: Column(
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isHidden = !isHidden;
                      });
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      padding: const EdgeInsets.all(10),
                      child: Image.asset(isHidden
                          ? 'assets/not_visible.png'
                          : 'assets/visible.png'),
                    ),
                  )
                ],
              ),
              Text(isHidden ? '***' : getDisplayCurrency(widget.balance),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * 0.055)),
            ],
          ),
          if (isDropdown)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    sourceBalance("Wallet", 1000000, isHidden),
                    sourceBalance("Bank", 2000000, isHidden),
                    sourceBalance("Stock", 3000000, isHidden),
                    sourceBalance("Saving", 4000000, isHidden)
                  ],
                ),
              ),
            ),
          SizedBox(
            width: 200,
            height: 30,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isDropdown = !isDropdown;
                });
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(isDropdown ? 'Hide sources' : 'View sources'),
            ),
          ),
        ],
      ),
    );
  }

  Widget sourceBalance(String name, double money, bool isHidden) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.12,
            child: Text(name,
                style: const TextStyle(color: Colors.white, fontSize: 15)),
          ),
          Text(isHidden ? '***' : getDisplayCurrency(money),
              style: const TextStyle(color: Colors.white, fontSize: 15)),
        ],
      ),
    );
  }
}
