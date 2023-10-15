import 'package:chatgpt/core/app_core.dart';
import 'package:flutter/material.dart';

import 'header_modal.dart';

class AppMenu extends StatelessWidget {
  final Function() onRequestMenu;
  final bool willPop;

  const AppMenu({super.key, required this.onRequestMenu, this.willPop = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.withOpacity(0.4), width: 0.5),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 2.0),
            color: AppColors.kGrey,
            blurRadius: 4.0,
            spreadRadius: -2,
          )
        ],
      ),
      width: 250,
      child: Column(
        children: [
          menuItem('New Chat', Icons.add,
              () => willPop ? Navigator.pop(context) : {}),
          Divider(height: 1, color: Colors.grey.withOpacity(0.4)),
          menuItem('History', Icons.alarm, () => showHistory(context)),
          Divider(height: 1, color: Colors.grey.withOpacity(0.4)),
          menuItem('Settings', Icons.settings, () => showSettings(context)),
        ],
      ),
    );
  }

  Widget menuItem(String title, IconData icon, Function() onTap) {
    return InkWell(
      onTap: () {
        onRequestMenu();
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          children: [
            Text(title),
            const Spacer(),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
