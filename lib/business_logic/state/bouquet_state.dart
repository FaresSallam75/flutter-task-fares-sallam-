import 'package:equatable/equatable.dart';

class BouquetState extends Equatable {
  const BouquetState();
  @override
  List<Object?> get props => [];
}

class BouquetInitialState extends BouquetState {
  final bool isRefresh;
  const BouquetInitialState({required this.isRefresh});
  @override
  List<Object?> get props => [isRefresh];
}

class BouquetLoadingState extends BouquetState {
  const BouquetLoadingState();
  @override
  List<Object?> get props => [];
}

class BouquetLoadedState extends BouquetState {
  final List<Map> listBouquetsData;
  const BouquetLoadedState({required this.listBouquetsData});
  @override
  List<Object?> get props => [listBouquetsData];
}

class BouquetFailureState extends BouquetState {
  final String message;
  const BouquetFailureState(this.message);
  @override
  List<Object?> get props => [message];
}
