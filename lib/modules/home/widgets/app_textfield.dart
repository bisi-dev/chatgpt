import 'package:chatgpt/core/app_core.dart';
import 'package:flutter/material.dart';

import 'chat_modal.dart';

class AppTextField extends StatefulWidget {
  final bool isNew;
  final bool isLoading;
  const AppTextField({
    super.key,
    this.isNew = true,
    this.isLoading = false,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: false,
            controller: queryController,
            style: const TextStyle(fontSize: 14),
            minLines: 1,
            maxLines: 4,
            decoration: InputDecoration(
              hintText: 'Message',
              hintStyle: const TextStyle(fontSize: 14, color: AppColors.kGrey),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(24.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(24.0),
              ),
              suffixIcon: UnconstrainedBox(
                child: Image.asset(height: 28, AppImages.listen),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        InkWell(
          onTap: () {
            if (queryController.text.isNotEmpty) {
              if (widget.isNew) {
                ChatData.list.clear();
              }
              ChatData.list.add(queryController.text);
              queryController.clear();
              showChat(context);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kLPurple,
              borderRadius: BorderRadius.circular(100),
            ),
            height: 40,
            padding: const EdgeInsets.all(8),
            child: widget.isLoading
                ? Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Container(
                        height: 12, width: 12, color: AppColors.kWhite),
                  )
                : const Icon(Icons.arrow_upward, color: AppColors.kWhite),
          ),
        )
      ],
    );
  }
}
