import 'package:flutter/material.dart';
import 'package:task/presentation/widget/custom_text.dart';

class CustomCardData extends StatelessWidget {
  final Size size;
  final ThemeData theme;
  const CustomCardData({super.key, required this.size, required this.theme});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82.0,
      width: size.width,
      margin: EdgeInsets.only(top: 30.0),
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      decoration: BoxDecoration(
        color: Color.fromRGBO(247, 247, 247, 1.0),
        borderRadius: BorderRadius.circular(8.0),
        border: BoxBorder.all(style: BorderStyle.solid, width: 1.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            title: "باقات مخصصة لك",
            textStyle: theme.textTheme.headlineSmall!.copyWith(fontSize: 14.0),
          ),
          CustomText(
            title: "تواصل معنا لأختيار الباقة المناسبة لك",
            textStyle: theme.textTheme.headlineSmall!.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
            ),
          ),
          CustomText(
            title: "فريق المبيعات",
            textStyle: theme.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(0, 121, 254, 1.0),
            ),
          ),
        ],
      ),
    );
  }
}
