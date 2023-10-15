import 'package:chatgpt/core/app_core.dart';
import 'package:flutter/material.dart';

class Hamburger extends StatelessWidget {
  const Hamburger({super.key, required this.isDisabled});
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      width: 42,
      decoration: BoxDecoration(
        color: AppColors.kGrey11,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Icon(
        Icons.more_horiz,
        color: isDisabled ? AppColors.kGrey70 : AppColors.kBlack,
      ),
    );
  }
}
