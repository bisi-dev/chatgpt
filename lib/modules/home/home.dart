import 'package:chatgpt/core/app_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/app_bar.dart';
import 'widgets/app_menu.dart';
import 'widgets/app_textfield.dart';
import 'widgets/header.dart';
import 'widgets/header_modal.dart';
import 'widgets/quick_query_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = true;
  bool showMenu = false;
  String bannerText = '';
  String completedText = 'ChatGPT';

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  void loadApp() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => loading = false);
    while (completedText.length > bannerText.length) {
      bannerText = completedText.substring(0, bannerText.length + 1);
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {});
    }
  }

  void onRequestMenu() {
    setState(() => showMenu = !showMenu);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => showMenu = false);
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: CupertinoPageScaffold(
        child: Scaffold(
          appBar: blankAppBar(),
          drawer: const Drawer(width: 0, child: SizedBox()),
          drawerScrimColor: Colors.transparent,
          onDrawerChanged: (isOpened) {
            if (isOpened) {
              showHistory(context);
            }
          },
          body: loading
              ? Center(child: chatIcon())
              : SafeArea(
                  child: Column(
                    children: [
                      AppHeader(
                        showMenu: showMenu,
                        onRequestMenu: onRequestMenu,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            showMenu
                                ? Positioned(
                                    top: 4,
                                    right: 16,
                                    child: AppMenu(
                                      onRequestMenu: onRequestMenu,
                                    ),
                                  )
                                : const SizedBox(),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    bannerText,
                                    style: const TextStyle(fontSize: 32),
                                  ),
                                  chatIcon(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const QuickQueryList(),
                      const SizedBox(height: 16),
                      const AppTextField(),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget chatIcon() {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: AppColors.kBlack,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
