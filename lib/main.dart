import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task/business_logic/cubit/room_cubit.dart';
import 'package:task/business_logic/cubit/theme_cubit.dart';
import 'package:task/business_logic/state/theme_state.dart';
import 'package:task/presentation/screen/filter.dart';
import 'package:task/presentation/screen/mainpage.dart';

Box? myBox;
Future<Box> initBoxHive(String boxName) async {
  if (!Hive.isBoxOpen(boxName)) {
    log("Box is not open");
    Hive.init((await getApplicationDocumentsDirectory()).path);
  } else {
    log("Box is already open");
  }
  return Hive.openBox(boxName);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  myBox = await initBoxHive("fares");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSettingsCubit(),
      child: BlocBuilder<AppSettingsCubit, AppSettingsState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            debugShowMaterialGrid: false,
            locale: state.locale,
            // home: Add(),
            initialRoute: "/",
            routes: {
              "/": (context) => MainPage(),
              "/filter": (context) => BlocProvider(
                create: (context) => RoomCubit(),
                child: FilterScreen(),
              ),
            },
          );
        },
      ),
    );
  }
}
