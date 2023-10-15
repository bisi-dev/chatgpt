import 'package:chatgpt/core/app_core.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget blankAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    toolbarHeight: 0,
    elevation: 0,
    backgroundColor: AppColors.kWhite,
  );
}
