import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/home_page_category_entity.dart';

part 'home_page_category_states.freezed.dart';

@freezed
class HomepageCategoryState with _$HomepageCategoryState {
  const factory HomepageCategoryState.initial() = _Initial;
  const factory HomepageCategoryState.categoryLoadingState() =
      _LoadingCategoryState;
  const factory HomepageCategoryState.categoryLoadedState({
    required HomePageCategoryEntity categoriesData,
  }) = _LoadedCategoryState;
}
