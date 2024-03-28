import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ugaoo/pages/home_page/domain/entities/product_entities/product_data_entity.dart';
import 'package:ugaoo/pages/home_page/domain/usecases/fetch_products_usecase.dart';
import 'package:ugaoo/pages/home_page/home_page_dependency_injection.dart';
import 'package:ugaoo/pages/home_page/states/home_data_controllers/home_page_data_states.dart';

import 'home_page_data_notifier_test.mocks.dart';

@GenerateNiceMocks([MockSpec<FetchProductDataUsecase>()])
ProviderContainer createContainer(
    {required MockFetchProductDataUsecase usecase}) {
  final container = ProviderContainer(
    overrides: [
      HomePageDependencyInjection.fetchProductDataUsecase
          .overrideWithValue(usecase),
    ],
  );

  addTearDown(container.dispose);
  return container;
}

class Listener<T> extends Mock {
  void call(T? previous, T? next);
}

void main() {
  late MockFetchProductDataUsecase mockUsecase;
  late ProviderContainer container;

  setUp(() {
    mockUsecase = MockFetchProductDataUsecase();
    container = createContainer(usecase: mockUsecase);
  });

  test("Initial State", () {
    final listener = Listener<AsyncValue<HomePageDataStates>>();

    container.listen(
      HomePageDependencyInjection.homepageProductProvider,
      listener,
      fireImmediately: true,
    );

    final notifier =
        container.read(HomePageDependencyInjection.homepageProductProvider);

    expect(notifier, equals(const AsyncData(HomePageDataStates.initial())));
    verify(listener(null, const AsyncData(HomePageDataStates.initial())));
    verifyNoMoreInteractions(listener);
    verifyNever(mockUsecase.fetchProducts());
  });

  test("Fetch Product Success", () async {
    final listener = Listener<AsyncValue<HomePageDataStates>>();
    container.listen(
      HomePageDependencyInjection.homepageProductProvider,
      listener,
      fireImmediately: true,
    );

    when(mockUsecase.fetchProducts()).thenAnswer(
      (realInvocation) => Future.value(const ProductDataEntity()),
    );

    final notifier = container.read(
      HomePageDependencyInjection.homepageProductProvider.notifier,
    );

    await notifier.fetchProducts();

    verifyInOrder([
      listener(null, const AsyncData(HomePageDataStates.initial())),
      listener(
        const AsyncData(HomePageDataStates.initial()),
        const AsyncData(HomePageDataStates.loadingState()),
      ),
      listener(
        const AsyncData(HomePageDataStates.loadingState()),
        const AsyncData(
          HomePageDataStates.loadedState(
            productData: const ProductDataEntity(),
          ),
        ),
      ),
    ]);

    verifyNoMoreInteractions(listener);
    verify(mockUsecase.fetchProducts()).called(1);
  });

  test("Fetch Product - Error", () async {
    final listener = Listener<AsyncValue<HomePageDataStates>>();
    container.listen(
      HomePageDependencyInjection.homepageProductProvider,
      listener,
      fireImmediately: true,
    );

    when(mockUsecase.fetchProducts()).thenThrow(Exception());

    final notifier = container.read(
      HomePageDependencyInjection.homepageProductProvider.notifier,
    );

    expect(() => notifier.fetchProducts(), throwsException);
    verifyInOrder([
      listener(null, const AsyncData(HomePageDataStates.initial())),
      listener(
        const AsyncData(HomePageDataStates.initial()),
        const AsyncData(HomePageDataStates.loadingState()),
      ),
    ]);
    verifyNoMoreInteractions(listener);
    verify(mockUsecase.fetchProducts()).called(1);
  });
}
