import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/cubit/bouquet_cubit.dart';
import 'package:task/business_logic/cubit/items_cubit.dart';
import 'package:task/constants/colors.dart';
import 'package:task/presentation/screen/Bouquet.dart';
import 'package:task/presentation/screen/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  // String? currentPage;

  final List<Widget> _screens = [
    BlocProvider(create: (context) => ItemsCubit(), child: const HomePage()),
    const Center(child: Text("Chat Screen")),
    const Center(child: Text("Add Ad Screen")),
    const Center(child: Text("My Ads Screen")),
    BlocProvider(create: (context) => BouquetCubit(), child: BouquetScreen()),
  ];

  // final List<String> _titles = [
  //   "الرئيسية", //Create your order
  //   "محادثة",
  //   "أضف أعلان",
  //   "أعلاناتى",
  //   "حسابى",
  // ];

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return customBodyScreen(theme);
  }

  Widget customBodyScreen(ThemeData theme) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_titles[_selectedIndex]),
      //   titleTextStyle: theme.appBarTheme.titleTextStyle,
      //   // backgroundColor: MyColors.orange,
      // ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: MyColors.black,
        unselectedItemColor: MyColors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.bungalow),
            label: "الرئيسية",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "محادثة"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: "أضف أعلان",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.dataset), label: "أعلاناتى"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "حسابى",
          ),
        ],
      ),
    );
  }
}
