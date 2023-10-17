import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listify/domain/models/product_model.dart';
import 'package:uuid/uuid.dart';

part 'list_cubit.freezed.dart';
part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(const ListState.loaded([]));

  final List<Product> productList = [];
  var uuid = const Uuid();
  CollectionReference usersDb = FirebaseFirestore.instance.collection('users');

  CollectionReference productsDb =
      FirebaseFirestore.instance.collection('products');

  void addToList(Product product, String nameOfProduct) async {
    // productsDb.doc(product.id).set({'nameOfProduct': nameOfProduct});

    final x = FirebaseAuth.instance.currentUser;
    final userid = x?.uid;
    usersDb.doc(userid).set({'name': nameOfProduct});
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

//kolekcja users => dokument z id usera => kolekcja products => dokumenty z produktami

//usuwa wszystko
// productsDb.snapshots().forEach((element) {
//   for (QueryDocumentSnapshot snapshot in element.docs) {
//     snapshot.reference.delete();
//     print('Element deleted');
//   }
// });
