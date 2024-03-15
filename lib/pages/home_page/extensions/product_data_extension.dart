import 'package:ugaoo/pages/home_page/data/model/product_models/home_page_model.dart';
import 'package:ugaoo/pages/home_page/data/model/product_models/product_category_model.dart';
import 'package:ugaoo/pages/home_page/data/model/product_models/product_data_model.dart';
import 'package:ugaoo/pages/home_page/data/model/product_models/product_model.dart';
import 'package:ugaoo/pages/home_page/data/model/product_models/sub_category_model.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/home_page_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_category_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_data_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_entity.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/sub_category_entity.dart';

extension XHomePageModel on HomePageModel {
  HomePageEntity toEntity() => HomePageEntity(
        productData: this.productData?.toEntity(),
      );
}

extension XProductDataModel on ProductDataModel {
  ProductDataEntity toEntity() => ProductDataEntity(
        categories: this.categories?.map((e) => e.toEntity()).toList(),
      );
}

extension XProductCategoryModel on ProductCategoryModel {
  ProductCategoryEntity toEntity() => ProductCategoryEntity(
        categoryId: this.categoryId,
        subCategories: this.subCategories?.map((e) => e.toEntity()).toList(),
      );
}

extension XSubCategoryModel on SubCategoryModel {
  SubCategoryEntity toEntity() => SubCategoryEntity(
        subCategoryName: this.subCategoryName,
        products: this.products?.map((e) => e.toEntity()).toList(),
      );
}

extension XProductModel on ProductModel {
  ProductEntity toEntity() => ProductEntity(
        itemId: this.itemId,
        itemImageUrl: this.itemImageUrl,
        itemName: this.itemName,
        itemPrice: this.itemPrice,
      );
}
