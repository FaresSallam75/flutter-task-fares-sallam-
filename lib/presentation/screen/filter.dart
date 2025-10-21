// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/cubit/room_cubit.dart';
import 'package:task/business_logic/state/room_state.dart';
import 'package:task/constants/circuler_progress_indicztor.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/show_toast_notification.dart';
import 'package:task/presentation/widget/custom_text.dart';
import 'package:task/presentation/widget/custom_text_form.dart';
import 'package:task/presentation/widget/custommaterialbutton.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  FocusNode focusNode = FocusNode();
  late final RoomCubit roomCubit;
  int typeIndex = 0;
  int roomIndex = 0;
  int payIndex = 0;
  int conditionIndex = 0;

  @override
  void initState() {
    super.initState();
    roomCubit = context.read<RoomCubit>();
    roomCubit.getAllRooms();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        child: BlocBuilder<RoomCubit, RoomState>(
          builder: (context, state) {
            if (state is RoomLoadingState) {
              return customCirculrProgressIndicator();
            } else if (state is RoomFailureState) {
              ShowToastMessage.showErrorToastMessage(
                context,
                message: state.message,
              );
            }
            return customContentBodyData(theme, size);
          },
        ),
      ),
    );
  }

  Widget customContentBodyData(ThemeData theme, Size size) {
    return Column(
      children: [
        customTopContent(theme),
        customConstantText(theme, "الفئة"),
        SizedBox(height: 15.0),
        customRowData(
          theme,
          CustomText(
            padding: EdgeInsets.only(right: 5.0, top: 20.0),
            title: "تغيير",
            textStyle: theme.textTheme.headlineSmall!.copyWith(
              color: Color.fromRGBO(59, 76, 242, 1.0),
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          "عقارات\n",
          "فلل البيع",
          Icons.real_estate_agent,
          MyColors.orange,
        ),
        SizedBox(height: 20.0),
        Divider(thickness: 1.3, height: 0.7, color: MyColors.grey02),
        SizedBox(height: 20.0),
        customRowData(
          theme,
          Icon(Icons.arrow_back_ios, color: MyColors.black),
          "الموقع\n",
          "   مصر",
          Icons.location_on,
          MyColors.black,
        ),
        SizedBox(height: 20.0),
        Divider(thickness: 1.3, height: 0.7, color: MyColors.grey02),
        customConstantText(theme, "الأقساط الشهرية"),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextForm(theme: theme, hintText: ""),
            CustomTextForm(theme: theme, hintText: ""),
          ],
        ),
        customConstantText(theme, "النوع"),
        customTypeData(theme),
        customConstantText(theme, "عدد الغرف"),
        customRoomNumbers(theme),
        customConstantText(theme, "السعر"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomTextForm(theme: theme, hintText: "أقل سعر"),
            CustomTextForm(theme: theme, hintText: "أقصى سعر"),
          ],
        ),
        customConstantText(theme, "طريقة الدفع"),
        customPaymentType(theme),
        customConstantText(theme, "حالة العقار"),
        customPropertyConditionData(theme),
        customButton(theme, size),
      ],
    );
  }

  Widget customButton(ThemeData theme, Size size) {
    return CustomMaterialButton(
      color: MyColors.blue01,
      height: 44.0,
      minWidth: size.width,
      onPressed: () {},
      radius: 32.0,
      child: CustomText(
        title: "شاهد 10,000+ نتائج",
        textStyle: theme.textTheme.headlineSmall!.copyWith(
          fontWeight: FontWeight.w700,
          color: MyColors.white01,
        ),
      ),
    );
  }

  Widget customPropertyConditionData(ThemeData theme) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 65.0,
        child: ListView.separated(
          shrinkWrap: true,
          reverse: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 6.0),
          itemCount: roomCubit.listRoomsData.length,
          itemBuilder: (context, index) {
            final bool isSelected = index == conditionIndex;
            return GestureDetector(
              onTap: () {
                conditionIndex = index;
                roomCubit.refreshData();
              },
              child: Container(
                height: 42.0,
                margin: EdgeInsets.only(top: 15.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.center,
                decoration:
                    roomCubit.listRoomsData[index]['property_condition'] == ""
                    ? null
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: isSelected ? MyColors.blue01 : MyColors.grey02,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                child: CustomText(
                  title:
                      roomCubit.listRoomsData[index]['property_condition'] == ""
                      ? ""
                      : "${roomCubit.listRoomsData[index]['property_condition']}",
                  textStyle: theme.textTheme.headlineSmall!.copyWith(
                    fontSize: 14.0,
                    color: isSelected ? MyColors.blue01 : MyColors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget customRoomNumbers(ThemeData theme) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 65.0,
        child: ListView.separated(
          shrinkWrap: true,
          reverse: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 6.0),
          itemCount: roomCubit.listRoomsData.length,
          itemBuilder: (context, index) {
            final bool isSelected = index == roomIndex;
            return Wrap(
              children: [
                GestureDetector(
                  onTap: () {
                    roomIndex = index;
                    roomCubit.refreshData();
                  },
                  child: Container(
                    height: 42.0,
                    margin: EdgeInsets.only(top: 15.0),
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    alignment: Alignment.center,
                    decoration:
                        roomCubit.listRoomsData[index]['number_room'] == ""
                        ? null
                        : BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: isSelected
                                  ? MyColors.blue01
                                  : MyColors.grey02,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                    child: CustomText(
                      title:
                          "${roomCubit.listRoomsData[index]['number_room']}" ==
                              "الكل"
                          ? "${roomCubit.listRoomsData[index]['number_room']}"
                          : "${roomCubit.listRoomsData[index]['number_room']} غرف",
                      textStyle: theme.textTheme.headlineSmall!.copyWith(
                        fontSize: 14.0,
                        color: isSelected ? MyColors.blue01 : MyColors.black,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget customPaymentType(ThemeData theme) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        height: 65.0,
        child: ListView.separated(
          shrinkWrap: true,
          reverse: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(width: 6.0),
          itemCount: roomCubit.listRoomsData.length,
          itemBuilder: (context, index) {
            final bool isSelected = index == payIndex;
            return GestureDetector(
              onTap: () {
                payIndex = index;
                roomCubit.refreshData();
              },
              child: Container(
                height: 42.0,
                margin: EdgeInsets.only(top: 15.0),
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                alignment: Alignment.center,
                decoration: roomCubit.listRoomsData[index]['payment_type'] == ""
                    ? null
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(
                          color: isSelected ? MyColors.blue01 : MyColors.grey02,
                          width: 2.0,
                          style: BorderStyle.solid,
                        ),
                      ),
                child: CustomText(
                  title: roomCubit.listRoomsData[index]['payment_type'] == ""
                      ? ""
                      : "${roomCubit.listRoomsData[index]['payment_type']}",
                  textStyle: theme.textTheme.headlineSmall!.copyWith(
                    fontSize: 14.0,
                    color: isSelected ? MyColors.blue01 : MyColors.black,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget customTypeData(ThemeData theme) {
    return SizedBox(
      height: 65.0,
      child: ListView.separated(
        shrinkWrap: true,
        reverse: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => SizedBox(width: 6.0),
        itemCount: roomCubit.listRoomsData.length,
        itemBuilder: (context, index) {
          final bool isSelected = index == typeIndex;
          return GestureDetector(
            onTap: () {
              typeIndex = index;
              roomCubit.refreshData();
            },
            child: Container(
              height: 42.0,
              margin: EdgeInsets.only(top: 15.0),
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              alignment: Alignment.center,
              decoration: roomCubit.listRoomsData[index]['type'] == ""
                  ? null
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        color: isSelected ? MyColors.blue01 : MyColors.grey02,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                    ),
              child: CustomText(
                title: roomCubit.listRoomsData[index]['type'],
                textStyle: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 14.0,
                  color: isSelected ? MyColors.blue01 : MyColors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customRowData(
    ThemeData theme,
    Widget child,
    String titleOne,
    String titleTwo,
    IconData? icon,
    Color? color,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.ideographic,
      children: [
        child,
        Spacer(),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: titleOne,
                style: theme.textTheme.headlineSmall!.copyWith(fontSize: 14.0),
              ),
              TextSpan(
                text: titleTwo,
                style: theme.textTheme.headlineSmall!.copyWith(
                  fontSize: 12.0,
                  color: MyColors.grey02.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 15.0),
        Icon(icon, color: color),
      ],
    );
  }

  Widget customConstantText(ThemeData theme, String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: CustomText(
        padding: EdgeInsets.only(right: 5.0, top: 15.0),
        title: title,
        textStyle: theme.textTheme.headlineSmall!.copyWith(
          color: MyColors.grey02.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget customTopContent(ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: "رجوع للأفتراضى",
          textStyle: theme.textTheme.headlineSmall!.copyWith(
            color: MyColors.blue01,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        CustomText(title: "فلترة", textStyle: theme.textTheme.headlineLarge),
        SizedBox(width: 12.0),
        IconButton(
          icon: Icon(Icons.close_outlined, size: 20.0),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
