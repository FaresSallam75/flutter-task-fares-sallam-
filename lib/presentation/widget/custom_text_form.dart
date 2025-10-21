import 'package:flutter/material.dart';
import 'package:task/constants/colors.dart';

class CustomTextForm extends StatelessWidget {
  final ThemeData theme;
  final String? hintText;
  const CustomTextForm({
    super.key,
    required this.theme,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        height: 48.0,
        width: 158.0,
        child: TextFormField(
          onTapUpOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: hintText == null
                ? null
                : theme.textTheme.headlineSmall!.copyWith(
                    fontSize: 14.0,
                    color: MyColors.grey,
                  ),
            contentPadding: EdgeInsets.all(12.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.grey, width: 0.8),
              borderRadius: BorderRadius.circular(8.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: MyColors.grey, width: 0.8),

              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
