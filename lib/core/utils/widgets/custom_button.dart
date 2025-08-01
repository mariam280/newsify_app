import 'package:flutter/material.dart';
import 'package:newsify/core/utils/app_styles.dart';

class CustomButon extends StatelessWidget {
   CustomButon({super.key,  this.onTap ,required this.text}) ;
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color:  Colors.black,
          borderRadius: BorderRadius.circular(25),
        ),
        height: 50,
        child: Center(
          child: Text(text,style: AppStyles.styleMedium13(context).copyWith(
            color: Colors.white,
            fontSize: 14,
          ),),
        ),
      ),
    );
  }
}
