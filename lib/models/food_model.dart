class FoodModel{
  final String name;
  final int calories;
  final int fat;
  final int protein;
  final int carbohydrates;


  FoodModel({
    required this.name,
    required this.calories,
    required this.fat,
    required this.protein,
    required this.carbohydrates,
});

  static FoodModel fromJson(Map<String, dynamic> json) => FoodModel(
    name: json['name'],
    calories: json['calories'],
    fat: json['fat'],
    protein: json['protein'],
    carbohydrates: json['carbs'],
  );
  Map<String, dynamic> toJson() =>{

    'name': name,
    'calories': calories,
    'fat': fat,
    'protein': protein,
    'carbs': carbohydrates,
  };
}