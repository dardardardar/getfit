

class ConsultantModel {

  String? uid;
  final String displayName;
  final int experience;
  final int price;
  final double rating;
  final String avatarUrl;

  ConsultantModel({
    this.uid = '',
    required this.displayName,
    required this.avatarUrl,
    required this.experience,
    required this.price,
    required this.rating,
  });

  Map<String , dynamic> toJson() =>{
    'uid': uid,
    'displayName': displayName,
    'avatarUrl': avatarUrl,
    'experience': experience,
    'price': price,
    'rating': rating,
  };

  static ConsultantModel fromJson(Map<String, dynamic> json) => ConsultantModel(
    uid: json['uid'],
    displayName: json['displayName'],
    avatarUrl: json['avatarUrl'],
    experience: json['experience'],
    price: json['price'],
    rating: json['rating'],
  );

}