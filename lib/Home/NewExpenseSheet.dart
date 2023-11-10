import 'package:flutter/material.dart';

class NewExpense extends StatelessWidget {
  const NewExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // height: MediaQuery.of(context).size.height * 0.5,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: Icon(Icons.source_outlined),
                title: Text("Source"),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: Icon(Icons.category_outlined),
                title: Text("Category"),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: Icon(Icons.access_time_outlined),
                title: Text("Time"),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: Icon(Icons.note_alt_outlined),
                title: Text("Note"),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            Divider(),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: Icon(Icons.cloud),
                title: Text("Coming soon"),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: Icon(Icons.cloud),
                title: Text("Coming soon"),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: Icon(Icons.cloud),
                title: Text("Coming soon"),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
