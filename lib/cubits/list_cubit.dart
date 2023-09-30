import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listify/models/product_model.dart';

part 'list_cubit.freezed.dart';
part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(const ListState.loaded([]));

  final List<Product> productList = [];
  CollectionReference productsDb =
      FirebaseFirestore.instance.collection('products');

  void addToList(Product product, String nameOfProduct) async {
    productsDb.doc(product.id).set({'nameOfProduct': nameOfProduct});
    productList.add(product);
    emit(const ListState.idle());
    emit(ListState.loaded(productList));
  }

  void removeListProduct(Product product) async {
    productsDb.doc(product.id).delete();
    productList.remove(product);
    emit(const ListState.idle());
    emit(ListState.loaded(productList));
  }
}

//usuwa wszystko
// productsDb.snapshots().forEach((element) {
//   for (QueryDocumentSnapshot snapshot in element.docs) {
//     snapshot.reference.delete();
//     print('Element deleted');
//   }
// });
