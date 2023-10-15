import 'package:chatgpt/core/app_core.dart';
import 'package:flutter/material.dart';

import 'app_menu.dart';
import 'app_textfield.dart';
import 'hamburger.dart';

void showChat(BuildContext context) {
  showBottomSheet(
    context: context,
    builder: (context) {
      return const Chat();
    },
  );
}

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool isLoading = true;
  bool showMenu = false;
  String chatText = '';
  String completedText =
      'This is your sample answer from the ChatGPT Replica App';

  void onRequestMenu() {
    setState(() => showMenu = !showMenu);
  }

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  void loadApp() async {
    while (completedText.length > chatText.length) {
      chatText = completedText.substring(0, chatText.length + 1);
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        setState(() {});
      }
    }
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => showMenu = false);
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: AppColors.kWhite,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ChatData.list.length,
                    itemBuilder: (context, index) {
                      if (index + 1 == ChatData.list.length) {
                        return chatBlock(ChatData.list[index], chatText);
                      } else {
                        return chatBlock(ChatData.list[index], completedText);
                      }
                    },
                  ),
                ],
              ),
            ),
            showMenu
                ? Positioned(
                    top: 44,
                    right: 0,
                    child: AppMenu(
                      onRequestMenu: onRequestMenu,
                      willPop: true,
                      onChat: true,
                    ),
                  )
                : const SizedBox(),
            Positioned(
              top: 0,
              right: 0,
              child: InkWell(
                onTap: onRequestMenu,
                child: Hamburger(isDisabled: showMenu),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 32,
                  child: AppTextField(isNew: false, isLoading: isLoading),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget chatBlock(String question, String answer) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.kGrey50,
              ),
              padding: const EdgeInsets.all(4.0),
              child: const Text(
                'JS',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'JOHN SMITH',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(question, style: const TextStyle(fontSize: 14)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                AppImages.gLogo,
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'CHATGPT',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    answer,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class ChatData {
  static List<String> list = [];
}
