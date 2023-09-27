import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listify/models/product_model.dart';

part 'list_cubit.freezed.dart';
part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(const ListState.loaded([]));

  final List<Product> productList = [];

  void addToList(Product product) {
    productList.add(product);
    emit(const ListState.idle());
    emit(ListState.loaded(productList));
  }

  void removeListProduct(Product product) {
    productList.remove(product);
    emit(const ListState.idle());
    emit(ListState.loaded(productList));
  }
}
