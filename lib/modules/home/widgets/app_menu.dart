import 'package:chatgpt/core/app_core.dart';
import 'package:flutter/material.dart';

import 'header_modal.dart';

class AppMenu extends StatelessWidget {
  final Function() onRequestMenu;
  final bool willPop;
  final bool onChat;

  const AppMenu({
    super.key,
    required this.onRequestMenu,
    this.willPop = false,
    this.onChat = false,
  });

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
          if (onChat) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  height: 1,
                  thickness: 5,
                  color: Colors.grey.withOpacity(0.4),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Chat Schema',
                      style: TextStyle(color: Colors.grey, fontSize: 12)),
                ),
                Divider(height: 1, color: Colors.grey.withOpacity(0.4)),
                menuItem('Chat details', Icons.info_outline, () {}),
                Divider(height: 1, color: Colors.grey.withOpacity(0.4)),
                menuItem('Share chat', Icons.share, () {}),
                Divider(height: 1, color: Colors.grey.withOpacity(0.4)),
                menuItem('Rename', Icons.edit, () {}),
                Divider(height: 1, color: Colors.grey.withOpacity(0.4)),
                menuItem('Delete', Icons.delete, () {}, true),
              ],
            )
          ]
        ],
      ),
    );
  }

  Widget menuItem(String title, IconData icon, Function() onTap,
      [bool terminate = false]) {
    return InkWell(
      onTap: () {
        onRequestMenu();
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(title, style: TextStyle(color: terminate ? Colors.red : null)),
            const Spacer(),
            Icon(icon, color: terminate ? Colors.red : null),
          ],
        ),
      ),
    );
  }
}
