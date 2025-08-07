import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import 'package:general_tests/styles/app_styles.dart';

class ChallengeCard extends StatelessWidget {
  final String id;
  final DateTime createdAt;
  final double balance;
  final double equity;
  final String accountName;
  final int currentPhase;
  final int numPhases;
  final double size;
  final bool active;
  final bool isProAccount;

  ChallengeCard({
    super.key,
    required this.id,
    required this.createdAt,
    required this.balance,
    required this.equity,
    required this.accountName,
    required this.currentPhase,
    required this.numPhases,
    required this.size,
    required this.active,
    required this.isProAccount,
  });

  final DateFormat dateFormatter = DateFormat('MMM d, yyyy', 'en_US');
  final NumberFormat numberFormatter = NumberFormat('#,##0.##', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: AppBorders.cardRadius,
        gradient: RadialGradient(
          center: const Alignment(-1.0, -1.0),
          radius: 1,
          colors: [Colors.blue.shade900, AppColors.cardGradientEnd],
          stops: const [0.0, 1.0],
        ),
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      child: Column(
        children: [
          Padding(
            padding: AppPaddings.cardPadding,
            child: Row(children: [Text(accountName), proCard(), const Spacer(), secondaryCard(isProAccount)]),
          ),
          Container(
            padding: AppPaddings.cardLeftPadding,
            alignment: Alignment.centerLeft,
            child: Text("\$${numberFormatter.format(equity)}", style: const TextStyle(fontSize: 45, fontWeight: FontWeight.w700)),
          ),
          Padding(
            padding: AppPaddings.cardPadding,
            child: Row(
              children: [
                Text(
                  "Balance:",
                  style: const TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.w100),
                ),
                Text(
                  " \$${numberFormatter.format(balance)}",
                  style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.w600),
                ),
                dot(),
                Text(
                  "Bought ",
                  style: const TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.w100),
                ),
                Text(
                  dateFormatter.format(createdAt),
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white70,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.info_outline, color: Colors.white38, size: 19),
                dot(),
                Text(
                  "ID: $id",
                  style: const TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.w100),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.info_outline, color: Colors.white38, size: 19),
              ],
            ),
          ),
          Container(
            height: 50,
            color: Colors.white12,
            alignment: Alignment.center,
            child: Stack(
              children: [
                Text(
                  "--------------------------------------------------------------------------------------------------------------------------------------------------------------------",
                  style: const TextStyle(color: AppColors.shimmerLine),
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                ).animate(
                  onPlay: (controller) => controller.repeat(),
                  effects: [
                    ShimmerEffect(
                      delay: const Duration(milliseconds: 500),
                      color: Colors.lightBlue,
                      duration: const Duration(milliseconds: 2000),
                    ),
                    ShimmerEffect(
                      delay: const Duration(milliseconds: 2000),
                      color: Colors.lightBlue,
                      duration: const Duration(milliseconds: 2000),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [for (var i = 1; i < numPhases + 1; i++) stagesCard(i, currentPhase)],
                ),
              ],
            ),
          ),
          Padding(
            padding: AppPaddings.cardPadding,
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: AppPaddings.cardButtonPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.insert_chart_outlined, color: Colors.black, size: 23),
                    SizedBox(width: 8),
                    Text(
                      "Dashboard",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget proCard() {
    return Container(
      width: 55,
      height: 28,
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: const RadialGradient(
          center: Alignment.center,
          radius: 0.75,
          colors: [Color.fromARGB(10, 71, 117, 255), Color.fromARGB(10, 50, 101, 255)],
          stops: [0.3, 1.0],
        ),
        borderRadius: AppBorders.pillRadius,
        border: Border.all(color: AppColors.proBorder, width: 2),
        boxShadow: [BoxShadow(color: AppColors.proShadow, blurRadius: 12, spreadRadius: 1)],
      ),
      child: const Center(child: Text("PRO", style: TextStyle(fontSize: 15))),
    );
  }

  Widget secondaryCard(bool funded) {
    final List<Color> cardColor = funded
        ? const [Color.fromARGB(49, 86, 255, 71), Color.fromARGB(9, 71, 255, 71)]
        : const [Color.fromARGB(50, 71, 117, 255), Color.fromARGB(10, 71, 117, 255)];
    final Color borderColor = funded ? AppColors.fundedBorder : AppColors.proBorder;
    final Color glowColor = funded ? AppColors.fundedGlow : AppColors.proBorder;
    return Container(
      height: 30,
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: RadialGradient(center: Alignment.center, radius: 3, colors: cardColor, stops: const [0.3, 1.0]),
        borderRadius: AppBorders.pillRadius,
        border: Border.all(color: borderColor, width: 2),
        boxShadow: [BoxShadow(color: glowColor, blurRadius: 52, spreadRadius: 2)],
      ),
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("On Challenge", style: TextStyle(fontSize: 16, color: borderColor)),
        ),
      ),
    );
  }

  Widget dot() {
    return Container(
      width: 5,
      height: 5,
      margin: const EdgeInsets.symmetric(horizontal: 7),
      decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
    );
  }

  Widget stagesCard(int stage, int? activeStage) {
    return Container(
      height: 32,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: activeStage! >= stage
              ? [const Color.fromARGB(255, 45, 91, 230), const Color.fromARGB(255, 31, 58, 138)]
              : [const Color.fromARGB(255, 37, 56, 78), const Color.fromARGB(255, 29, 52, 78)],
          stops: const [0.3, 1.0],
        ),
        borderRadius: AppBorders.pillRadius,
        border: Border.all(color: Colors.white10, width: 1),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Icon(stage == 3 ? Icons.lock_open_rounded : Icons.bar_chart_rounded, color: Colors.white, size: 17),
          const SizedBox(width: 5),
          stage == 3
              ? const Text("Master Account", style: TextStyle(fontSize: 15))
              : Text("Evaluation $stage", style: const TextStyle(fontSize: 15)),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
