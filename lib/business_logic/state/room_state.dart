import 'package:equatable/equatable.dart';

class RoomState extends Equatable {
  const RoomState();
  @override
  List<Object?> get props => [];
}

class RoomInitialState extends RoomState {
  final bool isRefresh;
  const RoomInitialState({required this.isRefresh});
  @override
  List<Object?> get props => [isRefresh];
}

class RoomLoadingState extends RoomState {
  const RoomLoadingState();
  @override
  List<Object?> get props => [];
}

class RoomLoadedState extends RoomState {
  final List<Map> listRoomsData;
  const RoomLoadedState({required this.listRoomsData});
  @override
  List<Object?> get props => [listRoomsData];
}

class RoomFailureState extends RoomState {
  final String message;
  const RoomFailureState(this.message);
  @override
  List<Object?> get props => [message];
}
