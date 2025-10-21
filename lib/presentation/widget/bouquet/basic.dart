import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/presentation/widget/custom_text.dart';

class CustomBacicBouquet extends StatelessWidget {
  final ThemeData theme;
  final bool? value;
  final void Function(bool?)? onChanged;

  final String title;
  final String price;
  final String body;
  const CustomBacicBouquet({
    super.key,
    required this.theme,
    required this.value,
    required this.onChanged,
    required this.title,
    required this.price,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      margin: EdgeInsets.only(top: 30.0),
      decoration: BoxDecoration(
        color: MyColors.white01,
        borderRadius: BorderRadius.circular(8.0),
        border: BoxBorder.all(style: BorderStyle.solid, width: 1.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                padding: EdgeInsets.only(left: 5.0),
                title: price, //"3,000ج.م",
                textStyle: theme.textTheme.headlineSmall!.copyWith(
                  color: MyColors.orange,
                  decoration: TextDecoration.underline,
                  decorationColor: MyColors.orange,
                  decorationThickness: 2.0,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),

              Row(
                children: [
                  CustomText(
                    padding: EdgeInsets.only(left: 5.0),
                    title: title, //"أساسية",
                    textStyle: theme.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Checkbox(
                    value: value, //selectedList[indx[0]],
                    activeColor: MyColors.blue,
                    checkColor: MyColors.white,
                    onChanged: onChanged,
                    // (val) {
                    //   setState(() {
                    //     selectedList[indx[0]] = val!;
                    //   });
                    // },
                  ),
                ],
              ),
            ],
          ),
          Divider(thickness: 1.0, height: 0.5, color: MyColors.grey02),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomText(
                  title: body, //"صلاحية الأعلان 30 يوم",
                  textStyle: theme.textTheme.headlineSmall!.copyWith(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(width: 7.0),
                Icon(Icons.watch_later_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
