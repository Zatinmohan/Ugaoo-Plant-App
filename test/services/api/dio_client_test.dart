import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ugaoo/errors/http_exceptions.dart';
import 'package:ugaoo/services/api/api_provider.dart';
import 'package:ugaoo/services/api/repositories/network_request_repo.dart';

import 'dio_client_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NetworkRepo>()])
void main() {
  late MockNetworkRepo mockNetworkRepo;
  late ApiProvider apiProvider;

  setUp(() {
    mockNetworkRepo = MockNetworkRepo();
    apiProvider = ApiProvider(networkService: mockNetworkRepo);
  });

  test("Success Get Request - Response 200", () async {
    final dataResponse = {"status": "Success"};

    when(
      mockNetworkRepo.getRequest(
        endPoint: anyNamed("endPoint"),
        params: anyNamed("params"),
        useBaseUrl: anyNamed("useBaseUrl"),
      ),
    ).thenAnswer(
      (realInvocation) => Future.value(dataResponse),
    );

    final response = await apiProvider.getRequest(endPoint: "");

    expect(response, equals(dataResponse));
    verify(
      await mockNetworkRepo.getRequest(
        endPoint: anyNamed("endPoint"),
        params: anyNamed("params"),
        useBaseUrl: anyNamed("useBaseUrl"),
      ),
    ).called(1);
  });

  test("Succes Post Request - Response 200", () async {
    final dataResponse = {"status": "Success"};

    when(
      mockNetworkRepo.postRequest(
        endPoint: anyNamed("endPoint"),
        params: anyNamed("params"),
        useBaseUrl: anyNamed("useBaseUrl"),
      ),
    ).thenAnswer(
      (realInvocation) => Future.value(dataResponse),
    );

    final response = await apiProvider.postRequest(endPoint: "");

    expect(response, equals(dataResponse));
    verify(
      await mockNetworkRepo.postRequest(
        endPoint: anyNamed("endPoint"),
        params: anyNamed("params"),
        useBaseUrl: anyNamed("useBaseUrl"),
      ),
    ).called(1);
  });

  test("Error Get Request - Response 400", () {
    when(
      mockNetworkRepo.getRequest(
        endPoint: anyNamed("endPoint"),
        params: anyNamed("params"),
        useBaseUrl: anyNamed("useBaseUrl"),
      ),
    ).thenThrow(HttpExceptions.fromCode(errorCode: 400));

    final result = apiProvider.getRequest(endPoint: "");
    expect(
      result,
      throwsA(HttpExceptions.fromCode(errorCode: 400)),
    );
    verify(
      mockNetworkRepo.getRequest(
        endPoint: anyNamed("endPoint"),
        params: anyNamed("params"),
        useBaseUrl: anyNamed("useBaseUrl"),
      ),
    ).called(1);
  });

  test("Error Post Request - Response 400", () {
    when(
      mockNetworkRepo.postRequest(
        endPoint: anyNamed("endPoint"),
        params: anyNamed("params"),
        useBaseUrl: anyNamed("useBaseUrl"),
      ),
    ).thenThrow(
      HttpExceptions.fromCode(errorCode: 400),
    );

    final response = apiProvider.postRequest(endPoint: "");
    expect(
      response,
      throwsA(HttpExceptions.fromCode(errorCode: 400)),
    );
    verify(
      mockNetworkRepo.postRequest(
        endPoint: anyNamed("endPoint"),
        params: anyNamed("params"),
        useBaseUrl: anyNamed("useBaseUrl"),
      ),
    ).called(1);
  });
}
