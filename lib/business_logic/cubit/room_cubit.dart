import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/constants/sqflite_db.dart';
import '../state/room_state.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit() : super(RoomInitialState(isRefresh: false));

  SqlDatabase sqlDatabase = SqlDatabase();
  List<Map> listRoomsData = [];

  void refreshData() {
    final currentState = state;
    if (currentState is RoomInitialState) {
      final current = currentState.isRefresh;
      emit(RoomInitialState(isRefresh: !current));
    }
    setLoading(true);
  }

  void setLoading(bool value) {
    emit(RoomInitialState(isRefresh: value));
  }

  Future<void> getAllRooms() async {
    emit(RoomLoadingState());
    listRoomsData = await sqlDatabase.readData("SELECT * FROM 'rooms' ");
    emit(RoomLoadedState(listRoomsData: listRoomsData));
    log("listOfferData ====================== $listRoomsData");
  }
}
