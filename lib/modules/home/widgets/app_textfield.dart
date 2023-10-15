import 'package:chatgpt/core/app_core.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 14),
              minLines: 1,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Message',
                hintStyle:
                    const TextStyle(fontSize: 14, color: AppColors.kGrey),
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
          Container(
            decoration: BoxDecoration(
              color: AppColors.kLPurple,
              borderRadius: BorderRadius.circular(100),
            ),
            height: 40,
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.arrow_upward, color: AppColors.kWhite),
          )
        ],
      ),
    );
  }
}
