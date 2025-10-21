import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/business_logic/state/items_state.dart';
import 'package:task/constants/sqflite_db.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsInitialState(isRefresh: false));

  SqlDatabase sqlDatabase = SqlDatabase();
  List<Map> listOfferData = [];
  List<Map> listCategoriesData = [];
  List<Map> listItemsData = [];

  void refreshData() {
    final currentState = state;
    if (currentState is ItemsInitialState) {
      final current = currentState.isRefresh;
      emit(ItemsInitialState(isRefresh: !current));
    }
    setLoading(true);
  }

  void setLoading(bool value) {
    emit(ItemsInitialState(isRefresh: value));
  }

  Future<void> getAllOffers() async {
    emit(ItemsLoadingState());
    listOfferData = await sqlDatabase.readData(
      "SELECT * FROM 'offers' ORDER BY id DESC ",
    );
    emit(
      ItemsLoadedState(
        listOfferData: listOfferData,
        listCategoriesData: [],
        listItemsData: [],
      ),
    );
    log("listOfferData ====================== $listOfferData");
  }

  Future<void> getAllCategories() async {
    emit(ItemsLoadingState());
    listCategoriesData = await sqlDatabase.readData(
      "SELECT * FROM 'categories' ORDER BY id DESC ",
    );
    emit(
      ItemsLoadedState(
        listOfferData: [],
        listCategoriesData: listCategoriesData,
        listItemsData: [],
      ),
    );
    log("listCategoriesData ====================== $listCategoriesData");
  }

  Future<void> getAllItems() async {
    emit(ItemsLoadingState());
    listItemsData = await sqlDatabase.readData("SELECT * FROM 'items'");
    emit(
      ItemsLoadedState(
        listOfferData: [],
        listCategoriesData: [],
        listItemsData: listItemsData,
      ),
    );
    log("listCategoriesData ====================== $listCategoriesData");
  }
}
