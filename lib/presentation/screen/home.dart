import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/cubit/items_cubit.dart';
import 'package:task/business_logic/state/items_state.dart';
import 'package:task/constants/circuler_progress_indicztor.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/show_toast_notification.dart';
import 'package:task/presentation/widget/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ItemsCubit itemsCubit;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    itemsCubit = context.read<ItemsCubit>();
    itemsCubit.getAllOffers();
    itemsCubit.getAllCategories();
    itemsCubit.getAllItems();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
      child: BlocBuilder<ItemsCubit, ItemsState>(
        builder: (context, state) {
          if (state is ItemsLoadingState) {
            return customCirculrProgressIndicator();
          } else if (state is ItemsFailureState) {
            ShowToastMessage.showErrorToastMessage(
              context,
              message: state.message,
            );
          }
          return customContentBodyData(theme);
        },
      ),
    );
  }

  Widget customContentBodyData(ThemeData theme) {
    return Column(
      children: [
        customTopContent(theme, () {
          Navigator.of(context).pushNamed("/filter");
        }),
        SizedBox(height: 20.0),
        customOffersData(theme),
        SizedBox(height: 40.0),
        customCategoriesData(theme),
        SizedBox(height: 30.0),
        customConstantText(theme),
        customItemsData(theme),
      ],
    );
  }

  Widget customCategoriesData(ThemeData theme) {
    return SizedBox(
      height: 85.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: itemsCubit.listCategoriesData.length,
        separatorBuilder: (context, index) => SizedBox(width: 5.0),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              selectedIndex = index;
              itemsCubit.refreshData();
            },
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 62.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(width: 1.0, color: MyColors.grey01),
                    color: MyColors.grey02,
                  ),

                  child: Image.file(
                    File("${itemsCubit.listCategoriesData[index]['image']}"),
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.broken_image),
                  ),
                ),

                CustomText(
                  title: "${itemsCubit.listCategoriesData[index]['name']}",

                  textStyle: theme.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget customItemsData(ThemeData theme) {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: itemsCubit.listItemsData.length * 2,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 0.5,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        final actualIndex = index % itemsCubit.listItemsData.length;

        return SizedBox(
          height: 360.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: MyColors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    topRight: Radius.circular(4.0),
                  ),
                ),
                height: 215,
                child: Image.file(
                  File("${itemsCubit.listItemsData[actualIndex]['image']}"),
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.offline_bolt_rounded, color: MyColors.red),
                  CustomText(
                    title: itemsCubit.listItemsData[actualIndex]['name'] ?? '',
                    textStyle: theme.textTheme.headlineSmall!.copyWith(
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.favorite_border_outlined, color: MyColors.black),

                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${itemsCubit.listItemsData[actualIndex]['price']}',
                          style: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 14.0,
                            color: MyColors.red,
                          ),
                        ),
                        TextSpan(
                          text: 'جم/60,000,000',
                          style: theme.textTheme.headlineSmall!.copyWith(
                            fontSize: 12.0,
                            decorationThickness: 2,
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                    title: "تم بيع 3.3k+",
                    textStyle: theme.textTheme.headlineSmall!.copyWith(
                      fontSize: 10.0,
                      color: MyColors.grey,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Icon(
                    Icons.local_fire_department,
                    size: 15.0,
                    color: MyColors.grey,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset("assets/img.png", height: 22.0, width: 15.0),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.add_shopping_cart,
                      color: Color.fromRGBO(28, 27, 31, 1.0),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.fact_check_outlined, color: MyColors.blue),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget customConstantText(ThemeData theme) {
    return Container(
      height: 32.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: MyColors.orange01,
      ),
      child: Row(
        children: [
          CustomText(
            title: "لأى عرض تطلبه دلوقتى !",
            textStyle: theme.textTheme.headlineSmall!.copyWith(fontSize: 10.0),
          ),
          Spacer(),
          CustomText(
            title: "شحن مجانى",
            textStyle: theme.textTheme.headlineSmall!.copyWith(
              color: MyColors.green,
              fontSize: 12.0,
            ),
          ),
          Icon(Icons.check, color: MyColors.green, size: 20.0),
        ],
      ),
    );
  }

  Widget customOffersData(ThemeData theme) {
    return SizedBox(
      height: 45.0,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: itemsCubit.listOfferData.length,
        separatorBuilder: (context, index) => SizedBox(width: 5.0),
        itemBuilder: (context, index) {
          final bool isSelected = index == selectedIndex;
          return InkWell(
            onTap: () {
              selectedIndex = index;
              itemsCubit.refreshData();
            },
            child: Container(
              alignment: Alignment.center,
              height: 41.0,
              width: 94.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(width: 1.0, color: MyColors.grey01),
                color: MyColors.orange01,
              ),
              child: CustomText(
                textAlign: TextAlign.center,
                title: itemsCubit.listOfferData[index]['name'],
                textStyle: theme.textTheme.headlineSmall!.copyWith(
                  color: isSelected ? MyColors.orange : MyColors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget customTopContent(ThemeData theme, void Function()? onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back_outlined, color: MyColors.grey, size: 20.5),
              SizedBox(width: 5.0),
              CustomText(
                title: "الكل",
                textStyle: theme.textTheme.headlineSmall!.copyWith(
                  color: MyColors.grey,
                ),
              ),
            ],
          ),
        ),
        CustomText(
          title: "أستكشف العروض",
          textStyle: theme.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
