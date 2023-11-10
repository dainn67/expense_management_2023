import 'package:flutter/material.dart';

class PlanTab extends StatefulWidget {
  const PlanTab({super.key});

  @override
  State<PlanTab> createState() => _PlanTabState();
}

class _PlanTabState extends State<PlanTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            elevation: 10,
            child: const ListTile(
              title: Text("Add a payment plan"),
              leading: Icon(Icons.savings),
              subtitle: Text("Detailed plan for future purchase"),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Material(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            elevation: 10,
            child: const ListTile(
              title: Text("Add a saving plan"),
              leading: Icon(Icons.access_time),
              subtitle: Text("Saving plan for emergency, etc."),
            ),
          )
        ],
      ),
    );
  }
}
