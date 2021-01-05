import 'dart:convert';

import 'package:meta/meta.dart';

class Food {
  final String name;
  final double price;
  final int calories;
  final int time;
  final int portions;
  final int fat;
  final int sugar;
  final int salt;
  final int saturates;
  final String image;

  Food({
    @required this.name,
    @required this.price,
    @required this.calories,
    @required this.time,
    @required this.portions,
    @required this.fat,
    @required this.sugar,
    @required this.salt,
    @required this.saturates,
    @required this.image,
  });

  Food copyWith({
    String name,
    double price,
    int calories,
    int time,
    int portions,
    int fat,
    int sugar,
    int salt,
    int saturates,
    String image,
  }) {
    return Food(
      name: name ?? this.name,
      price: price ?? this.price,
      calories: calories ?? this.calories,
      time: time ?? this.time,
      portions: portions ?? this.portions,
      fat: fat ?? this.fat,
      sugar: sugar ?? this.sugar,
      salt: salt ?? this.salt,
      saturates: saturates ?? this.saturates,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'calories': calories,
      'time': time,
      'portions': portions,
      'fat': fat,
      'sugar': sugar,
      'salt': salt,
      'saturates': saturates,
      'image': image,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Food(
      name: map['name'],
      price: map['price'],
      calories: map['calories'],
      time: map['time'],
      portions: map['portions'],
      fat: map['fat'],
      sugar: map['sugar'],
      salt: map['salt'],
      saturates: map['saturates'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) => Food.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Food(name: $name, price: $price, calories: $calories, time: $time, portions: $portions, fat: $fat, sugar: $sugar, salt: $salt, saturates: $saturates, image: $image)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Food &&
        o.name == name &&
        o.price == price &&
        o.calories == calories &&
        o.time == time &&
        o.portions == portions &&
        o.fat == fat &&
        o.sugar == sugar &&
        o.salt == salt &&
        o.saturates == saturates &&
        o.image == image;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        price.hashCode ^
        calories.hashCode ^
        time.hashCode ^
        portions.hashCode ^
        fat.hashCode ^
        sugar.hashCode ^
        salt.hashCode ^
        saturates.hashCode ^
        image.hashCode;
  }
}
