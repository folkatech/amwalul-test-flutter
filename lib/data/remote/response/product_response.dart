import 'dart:convert';

class ProductResponse {
  final int id;
  final String name;
  final String cover;
  final String desc;
  final int price;

  ProductResponse({
    required this.id,
    required this.name,
    required this.cover,
    required this.desc,
    required this.price,
  });

  ProductResponse copyWith({
    int? id,
    String? name,
    String? cover,
    String? desc,
    int? price,
  }) {
    return ProductResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      cover: cover ?? this.cover,
      desc: desc ?? this.desc,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'cover': cover,
      'desc': desc,
      'price': price,
    };
  }

  factory ProductResponse.fromMap(Map<String, dynamic> map) {
    return ProductResponse(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      cover: map['cover'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductResponse.fromJson(String source) =>
      ProductResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductResponse(id: $id, name: $name, cover: $cover, desc: $desc, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductResponse &&
        other.id == id &&
        other.name == name &&
        other.cover == cover &&
        other.desc == desc &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        cover.hashCode ^
        desc.hashCode ^
        price.hashCode;
  }
}
