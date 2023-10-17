import 'package:equatable/equatable.dart';
import 'package:listify/domain/models/listify_category_model.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final MyCategory category;

  const Product({
    required this.id,
    required this.title,
    required this.category,
  });

  @override
  List<Object?> get props => [title, category];
}
