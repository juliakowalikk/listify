import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:listify/cubits/list_cubit.dart';
import 'package:listify/models/my_category_model.dart';
import 'package:listify/models/product_model.dart';
import 'package:uuid/uuid.dart';

class ListViewTile extends StatefulWidget {
  const ListViewTile({super.key});

  @override
  State<ListViewTile> createState() => _ListViewTileState();
}

class _ListViewTileState extends State<ListViewTile> {
  final TextEditingController productController = TextEditingController();
  bool isClicked = false;
  var uuid = const Uuid();

  @override
  Widget build(BuildContext context) => BlocBuilder<ListCubit, ListState>(
        builder: (context, state) => ListView.builder(
          shrinkWrap: true,
          itemCount: MyCategory.values.length,
          itemBuilder: (context, index) {
            final MyCategory item = MyCategory.values[index];
            return state.maybeWhen(
              orElse: () => const SizedBox(),
              loaded: (products) {
                List<Product> filteredProducts = products
                    .where((Product element) => element.category == item)
                    .toList();
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    leading: IconButton(
                      onPressed: () => _showMyDialog(item),
                      icon: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                    collapsedBackgroundColor: item.color,
                    backgroundColor: item.color,
                    title: Text(item.title),
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredProducts.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                          leading: Checkbox(
                            checkColor: Colors.white,
                            value: isClicked,
                            onChanged: (bool? value) => context
                                .read<ListCubit>()
                                .removeListProduct(filteredProducts[index]),
                          ),
                          title: Text(filteredProducts[index].title),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      );

  Future<void> _showMyDialog(MyCategory myCategory) async => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext dialogContext) => AlertDialog(
          title: Text(Strings.of(context).alertDialogTextFieldTitle),
          content: TextField(
            controller: productController,
            decoration: InputDecoration(
                hintText: Strings.of(context).alertDialogHintText),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: Text(Strings.of(context).alertDialogCloseButton)),
            TextButton(
              child: Text(Strings.of(context).alertDialogAddButton),
              onPressed: () {
                context.read<ListCubit>().addToList(
                      Product(
                        id: uuid.v1(),
                        title: productController.text,
                        category: myCategory,
                      ),
                      productController.text,
                    );
                productController.clear();
              },
            ),
          ],
        ),
      );
}
