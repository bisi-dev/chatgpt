import 'package:chatgpt/core/app_core.dart';
import 'package:chatgpt/shared/widgets/modal_sheet.dart';
import 'package:flutter/material.dart';

Widget header(BuildContext context, String title) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Positioned(
        right: 0,
        child: InkWell(
          onTap: () => Navigator.pop(context),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.kGrey50,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(4),
            child: const Icon(Icons.close, size: 14),
          ),
        ),
      )
    ],
  );
}

void showHistory(BuildContext context) {
  final focusN = FocusNode();

  showModalBottomSheet(
    context: context,
    clipBehavior: Clip.antiAlias,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    builder: (context) {
      return Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            color: AppColors.kSheet,
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header(context, 'History'),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: const TextStyle(fontSize: 14),
                        focusNode: focusN,
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                              fontSize: 14, color: AppColors.kGrey),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey.withOpacity(0)),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.zero,
                          fillColor: AppColors.kGrey11,
                          filled: true,
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.kGrey50,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                    focusN.hasFocus
                        ? const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          )
                        : const SizedBox()
                  ],
                ),
                SizedBox(height: focusN.hasFocus ? 400 : 300),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showSettings(BuildContext context) {
  showCupertinoModalSheet(
    context: context,
    builder: (context) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.925,
          color: AppColors.kSheet,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              header(context, 'Settings'),
            ],
          ),
        ),
      );
    },
  );
}
