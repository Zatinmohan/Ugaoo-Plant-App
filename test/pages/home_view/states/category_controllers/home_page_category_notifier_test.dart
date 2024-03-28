import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:ugaoo/pages/home_page/domain/entities/categories_entities/home_page_category_entity.dart';
import 'package:ugaoo/pages/home_page/domain/usecases/fetch_product_categories_usecase.dart';
import 'package:ugaoo/pages/home_page/home_page_dependency_injection.dart';
import 'package:ugaoo/pages/home_page/states/category_controllers/home_page_category_states.dart';

import 'home_page_category_notifier_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchProductCategoriesUsecase>()])
class Listener<T> extends Mock {
  void call(T? previous, T? next);
}

void main() {
  late MockFetchProductCategoriesUsecase mockFetchProductCategoriesUsecase;
  late ProviderContainer container;

  ProviderContainer makeProviderContainer(
    MockFetchProductCategoriesUsecase categoryRepo,
  ) {
    final container = ProviderContainer(
      overrides: [
        HomePageDependencyInjection.fetchProductCategoryUsecaseProvider
            .overrideWithValue(categoryRepo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  setUp(() {
    mockFetchProductCategoriesUsecase = MockFetchProductCategoriesUsecase();
    container = makeProviderContainer(mockFetchProductCategoriesUsecase);
  });
  test("Initial State Called", () {
    final listener = Listener<AsyncValue<HomepageCategoryState>>();

    container.listen(
      HomePageDependencyInjection.homepageCategoryProvider,
      listener,
      fireImmediately: true,
    );

    final result =
        container.read(HomePageDependencyInjection.homepageCategoryProvider);

    expect(
      result,
      equals(
        const AsyncData(HomepageCategoryState.initial()),
      ),
    );

    verify(
      listener(null, const AsyncData(HomepageCategoryState.initial())),
    );
    verifyNoMoreInteractions(listener);
    verifyNever(mockFetchProductCategoriesUsecase.fetchProductCategories());
  });

  test("Fetching Categories Successfully", () async {
    final listener = Listener<AsyncValue<HomepageCategoryState>>();

    container.listen(
      HomePageDependencyInjection.homepageCategoryProvider,
      listener,
      fireImmediately: true,
    );

    when(mockFetchProductCategoriesUsecase.fetchProductCategories()).thenAnswer(
      (_) => Future.value(
        const HomePageCategoryEntity(),
      ),
    );

    final result = container.read(
      HomePageDependencyInjection.homepageCategoryProvider.notifier,
    );

    await result.fetchProductCategories();

    verifyInOrder([
      listener(null, const AsyncData(HomepageCategoryState.initial())),
      listener(
        const AsyncData(HomepageCategoryState.initial()),
        const AsyncData(HomepageCategoryState.categoryLoadingState()),
      ),
      listener(
        const AsyncData(HomepageCategoryState.categoryLoadingState()),
        const AsyncData(
          HomepageCategoryState.categoryLoadedState(
            categoriesData: const HomePageCategoryEntity(),
          ),
        ),
      ),
    ]);
    verifyNoMoreInteractions(listener);
    verify(mockFetchProductCategoriesUsecase.fetchProductCategories())
        .called(1);
  });

  test("Fetching Categories - Error", () async {
    final listener = Listener<AsyncValue<HomepageCategoryState>>();

    container.listen(
      HomePageDependencyInjection.homepageCategoryProvider,
      (previous, next) {
        listener(previous, next);
      },
      fireImmediately: true,
    );

    when(mockFetchProductCategoriesUsecase.fetchProductCategories()).thenThrow(
      Exception(),
    );

    final notifier = container
        .read(HomePageDependencyInjection.homepageCategoryProvider.notifier);

    expect(() => notifier.fetchProductCategories(), throwsException);

    verifyInOrder([
      listener(null, const AsyncData(HomepageCategoryState.initial())),
      listener(
        const AsyncData(HomepageCategoryState.initial()),
        const AsyncData(HomepageCategoryState.categoryLoadingState()),
      ),
    ]);

    verifyNoMoreInteractions(listener);
    verify(mockFetchProductCategoriesUsecase.fetchProductCategories())
        .called(1);
  });
}
