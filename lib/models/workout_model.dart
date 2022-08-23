
class WorkoutModel{
  final String name;
  final int calories;

  WorkoutModel({
    required this.name,
    required this.calories,
  });

  static WorkoutModel fromJson(Map<String, dynamic> json) => WorkoutModel(
    name: json['name'],
    calories: json['calories'],
  );
  Map<String, dynamic> toJson() =>{
    'name': name,
    'calories': calories,
  };
}