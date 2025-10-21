import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';
import 'package:task/presentation/widget/custom_text.dart';

class CustomExtraBouquet extends StatelessWidget {
  final ThemeData theme;
  final String title;
  final String price;
  final bool? value;
  final void Function(bool?)? onChanged;
  final String intNum;
  const CustomExtraBouquet({
    super.key,
    required this.theme,
    required this.title,
    required this.price,
    required this.value,
    required this.onChanged,
    required this.intNum,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
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
                    title: title, //"أكسترا",
                    textStyle: theme.textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Checkbox(
                    value: value, //selectedList[indx[1]],
                    activeColor: MyColors.blue,
                    checkColor: MyColors.white,
                    onChanged: onChanged,
                    // (val) {
                    //   setState(() {
                    //     selectedList[indx[1]] = val!;
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
                  mainAxisSize: MainAxisSize.min,
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
                        title: intNum, //"7",
                        textStyle: theme.textTheme.headlineSmall!.copyWith(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    CustomText(
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
                    Row(
                      children: [
                        CustomText(
                          title: "رفع لأعلى القائمة كل 3 أيام",
                          textStyle: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(width: 7.0),
                        Icon(Icons.rocket),
                      ],
                    ),
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
