import 'package:chatgpt/core/app_core.dart';
import 'package:flutter/material.dart';

import 'gpt4_modal.dart';
import 'hamburger.dart';

class AppHeader extends StatelessWidget {
  final bool showMenu;
  final Function() onRequestMenu;

  const AppHeader({
    super.key,
    required this.showMenu,
    required this.onRequestMenu,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: AppColors.kGrey11,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 2.0),
                            color: AppColors.kGrey,
                            blurRadius: 4.0,
                            spreadRadius: -2,
                          )
                        ],
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.lightning,
                              height: 20, width: 20),
                          const SizedBox(width: 4),
                          const Text('GPT-3.5'),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.kGrey70,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () => showGPT4(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.star, height: 24, width: 24),
                          const SizedBox(width: 4),
                          const Text('GPT-4'),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.lock_outline,
                            size: 16,
                            color: AppColors.kGrey70,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          InkWell(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
              onRequestMenu();
            },
            child: Hamburger(isDisabled: showMenu),
          ),
        ],
      ),
    );
  }
}
