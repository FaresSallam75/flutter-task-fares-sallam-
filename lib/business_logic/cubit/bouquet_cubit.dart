import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/sqflite_db.dart';
import '../state/Bouquet_state.dart';

class BouquetCubit extends Cubit<BouquetState> {
  BouquetCubit() : super(BouquetInitialState(isRefresh: false));

  SqlDatabase sqlDatabase = SqlDatabase();
  List<Map> listBouquetsData = [];

  void refreshData() {
    final currentState = state;
    if (currentState is BouquetInitialState) {
      final current = currentState.isRefresh;
      emit(BouquetInitialState(isRefresh: !current));
    }
    setLoading(true);
  }

  void setLoading(bool value) {
    emit(BouquetInitialState(isRefresh: value));
  }

  Future<void> getAllBouquets() async {
    emit(BouquetLoadingState());
    listBouquetsData = await sqlDatabase.readData("SELECT * FROM 'bouquet' ");
    emit(BouquetLoadedState(listBouquetsData: listBouquetsData));
    log("listBouquetsData ====================== $listBouquetsData");
  }
}
