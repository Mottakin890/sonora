import 'package:meta/meta.dart';

@immutable
class RecentSearchEntity {
  final String name;
  final String type;
  final String imageUrl;

  const RecentSearchEntity({
    required this.name,
    required this.type,
    required this.imageUrl,
  });

  factory RecentSearchEntity.fromMap(Map<String, String> map) {
    return RecentSearchEntity(
      name: map['name'] ?? '',
      type: map['type'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentSearchEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          type == other.type &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => name.hashCode ^ type.hashCode ^ imageUrl.hashCode;
}

@immutable
class SearchCategoryEntity {
  final String name;
  final String color1;
  final String color2;
  final String imageUrl;

  const SearchCategoryEntity({
    required this.name,
    required this.color1,
    required this.color2,
    required this.imageUrl,
  });

  factory SearchCategoryEntity.fromMap(Map<String, String> map) {
    return SearchCategoryEntity(
      name: map['name'] ?? '',
      color1: map['color1'] ?? '',
      color2: map['color2'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchCategoryEntity &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          color1 == other.color1 &&
          color2 == other.color2 &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode =>
      name.hashCode ^ color1.hashCode ^ color2.hashCode ^ imageUrl.hashCode;
}
