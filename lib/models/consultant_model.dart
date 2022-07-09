

class ConsultantModel {

  String? uid;
  final int experience;
  final int price;
  final double rating;

  ConsultantModel({
    this.uid = '',
    required this.experience,
    required this.price,
    required this.rating,
  });

  Map<String , dynamic> toJson() =>{
    'uid': uid,
    'experience': experience,
    'price': price,
    'rating': rating,
  };

  static ConsultantModel fromJson(Map<String, dynamic> json) => ConsultantModel(
    uid: json['uid'],
    experience: json['experience'],
    price: json['price'],
    rating: json['rating'],
  );

}