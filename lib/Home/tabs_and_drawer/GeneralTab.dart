import 'package:flutter/material.dart';

class GeneralTab extends StatefulWidget {
  const GeneralTab({super.key});

  @override
  State<GeneralTab> createState() => _GeneralTabState();
}

class _GeneralTabState extends State<GeneralTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.24,
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text("BALANCE",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
              ),
              Text("12.000.000 vnđ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                      MediaQuery.of(context).size.width * 0.055)),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                    child: Row(
                      children: [
                        SizedBox(
                            width:
                            MediaQuery.of(context).size.width * 0.2,
                            child: const Text("Wallet",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15))),
                        const Text("1.000.000 vnđ",
                            style: TextStyle(
                                color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                    child: Row(
                      children: [
                        SizedBox(
                          width:
                          MediaQuery.of(context).size.width * 0.2,
                          child: const Text("Bank",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ),
                        const Text("5.000.000 vnđ",
                            style: TextStyle(
                                color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.025,
                    child: Row(
                      children: [
                        SizedBox(
                          width:
                          MediaQuery.of(context).size.width * 0.2,
                          child: const Text("Stock",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15)),
                        ),
                        const Text("6.000.000 vnđ",
                            style: TextStyle(
                                color: Colors.white, fontSize: 15)),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          const Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FeatureButton(
                        title: "New source", icon: Icon(Icons.add)),
                    FeatureButton(
                        title: "Load data",
                        icon: Icon(Icons.cloud_download_outlined)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FeatureButton(
                        title: "Delete all",
                        icon: Icon(Icons.delete_outline)),
                    FeatureButton(
                        title: "Upcoming",
                        icon: Icon(Icons.ac_unit)),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  const FeatureButton({super.key, required this.title, required this.icon});

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.2,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.128,
              height: MediaQuery.of(context).size.height * 0.065,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: icon,
              )),
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(title, style: const TextStyle(color: Colors.white)))
        ],
      ),
    );
  }
}
