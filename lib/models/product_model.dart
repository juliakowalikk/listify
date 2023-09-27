import 'package:equatable/equatable.dart';
import 'package:listify/models/my_category_model.dart';

class Product extends Equatable {
  final String title;
  final MyCategory category;

  const Product({
    required this.title,
    required this.category,
  });

  @override
  List<Object?> get props => [title, category];
}
