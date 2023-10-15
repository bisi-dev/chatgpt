import 'package:chatgpt/core/app_core.dart';
import 'package:chatgpt/shared/widgets/modal_sheet.dart';
import 'package:flutter/material.dart';

import '../models/gpt4.dart';

void showGPT4(BuildContext context) {
  showCupertinoModalSheet(
    context: context,
    // clipBehavior: Clip.antiAlias,
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    builder: (context) {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 0.925,
          color: AppColors.kWhite,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
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
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: Image.asset(height: 160, width: 160, AppImages.banner),
              ),
              const SizedBox(height: 20),
              const Text('GPT-4',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              const Text(
                'Our most powerful model, capable of advanced reasoning and creativity',
                style: TextStyle(fontSize: 18, color: AppColors.kGrey),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: GPT4.list.length,
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                          height: 40, width: 40, GPT4.list[index].image),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              GPT4.list[index].title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              GPT4.list[index].subtitle,
                              style: const TextStyle(
                                  fontSize: 16, color: AppColors.kGrey),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
              ),
              const Spacer(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Auto-renews for'),
                  Text(' \$20', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('/month until canceled'),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kmPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: const Text(
                        'Upgrade to Plus',
                        style: TextStyle(
                          color: AppColors.kWhite,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      );
    },
  );
}
