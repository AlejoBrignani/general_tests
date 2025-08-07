import 'package:flutter/material.dart';
import 'package:general_tests/widgets/challenge_card.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final format = DateFormat('MM-dd-yyyy');
  List<Map> examples = [
    {
      "id": "1234HFk43l",
      "createdAt": "05-20-2025",
      "balance": 6384,
      "equity": 5000,
      "accountName": "Two Step Challenge",
      "currentPhase": 1,
      "numPhases": 3,
      "size": 1,
      "active": false,
      "isProAccount": true,
    },
    {
      "id": "3256HFk43l",
      "createdAt": "05-20-2025",
      "balance": 6384,
      "equity": 25000,
      "accountName": "test1",
      "currentPhase": 3,
      "numPhases": 3,
      "size": 1,
      "active": true,
      "isProAccount": true,
    },
    {
      "id": "0274HFk43l",
      "createdAt": "05-20-2025",
      "balance": 6384,
      "equity": 5000,
      "accountName": "test1",
      "currentPhase": 1,
      "numPhases": 3,
      "size": 1,
      "active": true,
      "isProAccount": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-1.0, -1.0),
            radius: 2.0,
            colors: [const Color.fromARGB(255, 5, 10, 65), const Color.fromARGB(255, 0, 0, 7)],
            stops: [0.0, 1.0],
          ),
        ),
        padding: EdgeInsets.fromLTRB(50, 50, 30, 50),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 1200,
                mainAxisExtent: 340,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemCount: examples.length,
              itemBuilder: (context, index) {
                final example = examples[index];
                return ChallengeCard(
                  id: example["id"],
                  createdAt: format.parseStrict(example["createdAt"]),
                  balance: example["balance"],
                  equity: example["equity"],
                  accountName: example["accountName"],
                  currentPhase: example["currentPhase"],
                  numPhases: example["numPhases"],
                  size: example["size"],
                  active: example["active"],
                  isProAccount: example["isProAccount"],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
