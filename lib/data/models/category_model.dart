import '../../domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.name,
    required super.iconPath,
    required super.todayAmount,
    required super.totalAmount,
    required super.percentage,
    required super.isPositive,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) => CategoryModel(
        name:        map['name'],
        iconPath:    map['iconPath'],
        todayAmount: (map['todayAmount'] as num).toDouble(),
        totalAmount: (map['totalAmount'] as num).toDouble(),
        percentage:  (map['percentage'] as num).toDouble(),
        isPositive:  map['isPositive'],
      );
}
