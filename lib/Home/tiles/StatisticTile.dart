import 'package:flutter/material.dart';

class StatisticTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Icon icon;
  final String trailing;
  final Color trailingColor;

  const StatisticTile(
      {super.key,
        required this.title,
        required this.subtitle,
        required this.icon,
        required this.trailing,
        required this.trailingColor});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 10.0,
      child: Container(
        padding: const EdgeInsets.all(3.0),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 3.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          subtitle: Text(subtitle),
          leading: icon,
          trailing: Text(
            trailing,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: trailingColor),
          ),
        ),
      ),
    );
  }
}
