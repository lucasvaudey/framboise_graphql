import 'package:flutter/material.dart';
import 'package:framboise/models/user.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User user = Hive.box<User>('user').get('current')!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Center(
            child: TextButton(
              onPressed: () {
                //TODO: Open the gate
              },
              child: Text(
                "Ouvrir la barrière",
              ),
            ),
          ),
          Center(
            child: Text("Classement"),
          ),
          if (user.admin)
            Center(
              child: Text("Admin pannel"),
            ),
        ],
      ),
    );
  }
}
