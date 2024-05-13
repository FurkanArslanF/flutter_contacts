import 'package:flutter/material.dart';
import 'package:flutter_nexoft/core/contants/color.dart';
import 'package:flutter_nexoft/core/contants/string.dart';
import 'package:sizer/sizer.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({super.key, this.onChanged, this.controller});
  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.w,
      width: 85.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: ColorManager.WHITE,
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: AppStringConst.searchByName,
          prefixIcon: const Icon(Icons.search),
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
