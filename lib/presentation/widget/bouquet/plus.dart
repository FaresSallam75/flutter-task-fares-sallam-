import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/presentation/widget/custom_text.dart';

class CustomPlusBouquet extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final String price;
  final String intNum;
  final bool? value;
  final void Function(bool?)? onChanged;
  const CustomPlusBouquet({
    super.key,
    required this.theme,
    required this.title,
    required this.price,
    required this.intNum,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 326,
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
                    title: title, // "بلس",
                    textStyle: theme.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Checkbox(
                    value: value, //selectedList[indx[2]],
                    activeColor: MyColors.blue,
                    checkColor: MyColors.white,
                    onChanged: onChanged,
                    // (val) {
                    //   setState(() {
                    //     selectedList[indx[2]] = val!;
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 42.0,
                      width: 71.0,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: MyColors.green.withOpacity(0.05),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0),
                        ),
                        border: Border(
                          left: BorderSide(
                            style: BorderStyle.solid,
                            width: 1.0,
                            color: MyColors.green,
                          ),
                          right: BorderSide(
                            style: BorderStyle.solid,
                            width: 1.0,
                            color: MyColors.green,
                          ),
                          top: BorderSide(
                            style: BorderStyle.solid,
                            width: 1.0,
                            color: MyColors.green,
                          ),
                        ),
                      ),
                      child: CustomText(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        textAlign: TextAlign.center,
                        title: intNum, //"18",
                        textStyle: theme.textTheme.headlineSmall!.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    CustomText(
                      // padding: EdgeInsets.only(top: 15.0),
                      textAlign: TextAlign.center,
                      title: "ضعف عدد\n المشاهدات",
                      textStyle: theme.textTheme.headlineSmall!.copyWith(
                        fontSize: 12.0,
                        color: MyColors.black,
                        decoration: TextDecoration.underline,
                        decorationColor: MyColors.black,
                        decorationThickness: 1.5,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: "صلاحية الأعلان 30 يوم",
                          textStyle: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 7.0),
                        Icon(Icons.watch_later_rounded),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        CustomText(
                          title: "رفع لأعلى القائمة كل 2 أيام",
                          textStyle: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 7.0),
                        Icon(Icons.rocket),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '    تثبيت فى مقاول صحى\n',
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  fontSize: 14.0,
                                ),
                              ),
                              TextSpan(
                                text: '(خلال ال48 ساعة القادمة)',
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  fontSize: 14.0,
                                  color: MyColors.red,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 7.0),
                        Icon(Icons.archive_outlined),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        CustomText(
                          title: "ظهور فى كل محافظات مصر",
                          textStyle: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 7.0),
                        Icon(Icons.circle),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        CustomText(
                          title: "أعلان مميز",
                          textStyle: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 7.0),
                        Icon(Icons.workspace_premium),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        CustomText(
                          title: "تثبيت فى مقاول صحى فى الجهراء",
                          textStyle: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 7.0),
                        Icon(Icons.archive_outlined),
                      ],
                    ),
                    SizedBox(height: 6.0),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '    تثبيت فى مقاول صحى\n',
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  fontSize: 14.0,
                                ),
                              ),
                              TextSpan(
                                text: '(خلال ال48 ساعة القادمة)',
                                style: theme.textTheme.headlineSmall!.copyWith(
                                  fontSize: 14.0,
                                  color: MyColors.red,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: 7.0),
                        Icon(Icons.archive_outlined),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
