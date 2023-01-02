import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';
import 'add_money_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Wallet'),
      drawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text('RS 1000',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
            const SizedBox(height: 30),
            Row(
              children: [
                CircleAvatar(
                    radius: 25,
                    backgroundColor: blueGreen.withOpacity(0.2),
                    child: Icon(Icons.account_balance_wallet,
                        size: 25, color: blueGreen)),
                const Spacer(),
                const Text('Driver Wallet', style: TextStyle(fontSize: 18)),
                const Spacer(flex: 6),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: black, padding: const EdgeInsets.all(10)),
                  onPressed: () {
                    Get.to(const AddMoneyScreen());
                  },
                  child: const Text(
                    'Add Money',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
