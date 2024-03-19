import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_data_entity.dart';
part 'home_page_data_states.freezed.dart';

@freezed
class HomePageDataStates with _$HomePageDataStates {
  const factory HomePageDataStates.initial() = _Initial;
  const factory HomePageDataStates.loadingState() = _DataLoadingState;
  const factory HomePageDataStates.loadedState({
    required ProductDataEntity productData,
  }) = _DataLoadedState;
}
