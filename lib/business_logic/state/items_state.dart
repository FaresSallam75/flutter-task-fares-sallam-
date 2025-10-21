import 'package:equatable/equatable.dart';

class ItemsState extends Equatable {
  const ItemsState();
  @override
  List<Object?> get props => [];
}

class ItemsInitialState extends ItemsState {
  final bool isRefresh;
  const ItemsInitialState({required this.isRefresh});
  @override
  List<Object?> get props => [isRefresh];
}

class ItemsLoadingState extends ItemsState {
  const ItemsLoadingState();
  @override
  List<Object?> get props => [];
}

class ItemsLoadedState extends ItemsState {
  final List<Map> listOfferData;
  final List<Map> listCategoriesData;
  final List<Map> listItemsData;
  const ItemsLoadedState({
    required this.listOfferData,
    required this.listCategoriesData,
    required this.listItemsData,
  });
  @override
  List<Object?> get props => [listOfferData, listCategoriesData, listItemsData];
}

class ItemsFailureState extends ItemsState {
  final String message;
  const ItemsFailureState(this.message);
  @override
  List<Object?> get props => [message];
}
