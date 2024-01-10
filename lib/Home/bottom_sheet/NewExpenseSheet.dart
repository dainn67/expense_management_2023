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
                leading: const Icon(Icons.source_outlined),
                title: const Text("Source"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: const Icon(Icons.category_outlined),
                title: const Text("Category"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: const Icon(Icons.access_time_outlined),
                title: const Text("Time"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: const Icon(Icons.note_alt_outlined),
                title: const Text("Note"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            Divider(),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: const Icon(Icons.cloud),
                title: const Text("Coming soon"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: const Icon(Icons.cloud),
                title: const Text("Coming soon"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
            SizedBox(
              height: 60,
              child: ListTile(
                onTap: (){},
                leading: const Icon(Icons.cloud),
                title: const Text("Coming soon"),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
