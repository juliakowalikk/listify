part of 'list_cubit.dart';

@freezed
class ListState with _$ListState {
  const factory ListState.idle() = _Idle;
  const factory ListState.loaded(List<Product> productList) = _Loaded;
}
