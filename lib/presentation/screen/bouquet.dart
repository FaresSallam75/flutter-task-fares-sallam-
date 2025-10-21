import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/cubit/bouquet_cubit.dart';
import 'package:task/business_logic/state/Bouquet_state.dart';
import 'package:task/constants/circuler_progress_indicztor.dart';
import 'package:task/constants/colors.dart';
import 'package:task/constants/show_toast_notification.dart';
import 'package:task/presentation/widget/bouquet/basic.dart';
import 'package:task/presentation/widget/bouquet/custom_Clip.dart';
import 'package:task/presentation/widget/bouquet/extra.dart';
import 'package:task/presentation/widget/bouquet/plus.dart';
import 'package:task/presentation/widget/bouquet/super.dart';
import 'package:task/presentation/widget/custom_text.dart';
import 'package:task/presentation/widget/custommaterialbutton.dart';

class BouquetScreen extends StatefulWidget {
  const BouquetScreen({super.key});

  @override
  State<BouquetScreen> createState() => _BouquetScreenState();
}

class _BouquetScreenState extends State<BouquetScreen> {
  List<bool> selectedList = [false, false, false, false];
  List<int> indx = [0, 1, 2, 3];

  late final BouquetCubit bouquetCubit;

  @override
  void initState() {
    super.initState();
    bouquetCubit = context.read<BouquetCubit>();
    bouquetCubit.getAllBouquets();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      child: BlocBuilder<BouquetCubit, BouquetState>(
        builder: (context, state) {
          if (state is BouquetLoadingState) {
            return customCirculrProgressIndicator();
          } else if (state is BouquetFailureState) {
            ShowToastMessage.showErrorToastMessage(
              context,
              message: state.message,
            );
          }
          return customContentBodyData(theme, size);
        },
      ),
    );
  }

  Widget customContentBodyData(ThemeData theme, Size size) {
    return Column(
      children: [
        customTopContentBody(theme),
        CustomText(
          title: "أختار من باقات التمييز بل أسفل اللى تناسب أحتياجاتك",
          textStyle: theme.textTheme.headlineSmall!.copyWith(
            fontSize: 14.0,
            color: MyColors.grey,
          ),
        ),
        //  أساسية
        CustomBacicBouquet(
          theme: theme,
          value: selectedList[indx[0]],
          onChanged: (val) {
            selectedList[indx[0]] = val!;
            bouquetCubit.refreshData();
          },
          title: "${bouquetCubit.listBouquetsData[0]['name']}",
          price: "${bouquetCubit.listBouquetsData[0]['price']}ج.م",
          body: "صلاحية الأعلان 30 يوم",
        ),

        // أكسترا
        CustomExtraBouquet(
          theme: theme,
          title: "${bouquetCubit.listBouquetsData[1]['name']}",
          price: "${bouquetCubit.listBouquetsData[1]['price']}ج.م",
          value: selectedList[indx[1]],
          onChanged: (val) {
            selectedList[indx[1]] = val!;
            bouquetCubit.refreshData();
          },
          intNum: "${bouquetCubit.listBouquetsData[1]['int_num']}",
        ),
        customConstantText("أفضل قيمة مقابل سعر"),
        // بلس
        CustomPlusBouquet(
          theme: theme,
          title: "${bouquetCubit.listBouquetsData[2]['name']}",
          price: "${bouquetCubit.listBouquetsData[2]['price']}ج.م",
          intNum: "${bouquetCubit.listBouquetsData[2]['int_num']}",
          value: selectedList[indx[2]],
          onChanged: (val) {
            selectedList[indx[2]] = val!;
            bouquetCubit.refreshData();
          },
        ),
        customConstantText("أعلى مشاهدات"),
        // سوبر
        CustomPlusBouquet(
          theme: theme,
          title: "${bouquetCubit.listBouquetsData[3]['name']}",
          price: "${bouquetCubit.listBouquetsData[3]['name']}ج.م",
          intNum: "${bouquetCubit.listBouquetsData[3]['int_num']}",
          value: selectedList[indx[3]],
          onChanged: (val) {
            selectedList[indx[3]] = val!;
            bouquetCubit.refreshData();
          },
        ),

        ////////////////
        CustomCardData(size: size, theme: theme),
        CustomMaterialButton(
          color: MyColors.blue01,
          height: 44.0,
          minWidth: size.width,
          onPressed: () {},
          radius: 32.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back_rounded, color: MyColors.white01),
              CustomText(
                title: "التالى",
                textStyle: theme.textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.w700,
                  color: MyColors.white01,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget customConstantText(String title) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ClipPath(
        clipper: LeftTagClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          color: const Color(0xFFFFE6E6),
          child: CustomText(
            title: title,
            textStyle: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget customTopContentBody(ThemeData theme) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          title: "أختر الباقات اللى تناسبك",
          textStyle: theme.textTheme.headlineLarge,
        ),
        SizedBox(width: 12.0),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.keyboard_arrow_right, size: 30.0),
        ),
      ],
    );
  }
}
