import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:listify/domain/models/firebase_auth_model.dart';
import 'package:listify/domain/models/product_model.dart';
import 'package:uuid/uuid.dart';

part 'list_cubit.freezed.dart';
part 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  final AuthService authService;
  ListCubit(this.authService) : super(const ListState.loaded([]));

  final List<Product> productList = [];
  var uuid = const Uuid();
  CollectionReference usersDb = FirebaseFirestore.instance.collection('users');

  CollectionReference productsDb =
      FirebaseFirestore.instance.collection('products');

  void addToList(Product product) async {
    final x = authService.firebaseAuth.currentUser;
    final userid = x?.uid;
    usersDb
        .doc(userid)
        .collection('products')
        .doc(product.id)
        .set({'name': product.title});
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
