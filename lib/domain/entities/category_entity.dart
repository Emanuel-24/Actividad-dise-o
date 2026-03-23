class CategoryEntity {
  final String name;
  final String iconPath;
  final double todayAmount;
  final double totalAmount;
  final double percentage;
  final bool isPositive;

  const CategoryEntity({
    required this.name,
    required this.iconPath,
    required this.todayAmount,
    required this.totalAmount,
    required this.percentage,
    required this.isPositive,
  });
}
