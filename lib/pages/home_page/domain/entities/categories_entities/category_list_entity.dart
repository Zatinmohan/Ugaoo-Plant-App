import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/category_data_entity.dart';

class CategoryListEntity {
  final String? name;
  final CategoryDataEntity? fields;
  final String? createTime;
  final String? updateTime;

  const CategoryListEntity({
    this.name,
    this.fields,
    this.createTime,
    this.updateTime,
  });
}
