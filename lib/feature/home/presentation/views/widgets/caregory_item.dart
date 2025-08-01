import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.isSelected, required this.text});
  final bool isSelected;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 25),
      decoration: BoxDecoration(
        color: isSelected ? Colors.black : Color(0xffEEEEEE),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            text,
            style: AppStyles.styleMedium13(context)
                .copyWith(color: isSelected ? Colors.white : Colors.grey),
          ),
        ),
      ),
    );
  }
}
