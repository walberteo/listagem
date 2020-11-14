import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'package:listagem/app/modules/home/repositories/user_repository.dart';
import 'package:listagem/app/shared/utils/http_erros.dart';

class DioSpy extends Mock implements Dio {}

void main() {
  UserRepository sut;
  DioSpy client;
  int page;
  String seed;

  PostExpectation mockRequest() => when(client.get(any));

  void mockHttpData(int statusCode, {String data}) {
    mockRequest()
        .thenAnswer((_) async => Response(data: data, statusCode: statusCode));
  }

  void mockHttpError(HttpError error) {
    mockRequest().thenThrow(error);
  }

  String mockValidData() =>
      '{"results":[{"gender":"female","name":{"title":"Mrs","first":"Marga","last":"Ferreira"},"location":{"street":{"number":1735,"name":"Rua Treze de Maio "},"city":"Açailândia","state":"Maranhão","country":"Brazil","postcode":86270,"coordinates":{"latitude":"-8.0476","longitude":"41.1456"},"timezone":{"offset":"-11:00","description":"Midway Island, Samoa"}},"email":"marga.ferreira@example.com","login":{"uuid":"a6512d15-de64-41b8-b8d3-9be786700181","username":"brownmeercat741","password":"soprano","salt":"5xreTFEF","md5":"abacf0a42b55e1a7b563cadf10746be7","sha1":"fa1206a5cdf3ffa1901dff091a4af17aa9730770","sha256":"299cd950e38f20f2ab0107e9a924e5c2e027cb39f42bbf0f8f2a3e6943c1d6c8"},"dob":{"date":"1993-09-20T21:19:33.394Z","age":27},"registered":{"date":"2010-04-11T21:58:54.621Z","age":10},"phone":"(44) 0005-1612","cell":"(69) 0738-8114","id":{"name":"","value":null},"picture":{"large":"https://randomuser.me/api/portraits/women/49.jpg","medium":"https://randomuser.me/api/portraits/med/women/49.jpg","thumbnail":"https://randomuser.me/api/portraits/thumb/women/49.jpg"},"nat":"BR"}],"info":{"seed":"2uXUsYY=","results":1,"page":1,"version":"1.3"}}';

  setUp(() {
    page = faker.randomGenerator.integer(10);
    seed = faker.lorem.word();
    client = DioSpy();
    sut = UserRepository(client);
  });

  test('should call load with correct values', () async {
    mockHttpData(200, data: mockValidData());

    await sut.load(page: page, seed: seed);

    verify(client.get(any));
  });

  test('should throw BadRequest if client return 400', () async {
    mockHttpError(HttpError.badRequest);

    final future = sut.load(page: page, seed: seed);

    expect(future, throwsA(HttpError.badRequest));
  });

  test('should throw Unauthorized if client return 401', () async {
    mockHttpError(HttpError.unauthorized);

    final future = sut.load(page: page, seed: seed);

    expect(future, throwsA(HttpError.unauthorized));
  });

  test('should throw Forbidden if client return 403', () async {
    mockHttpError(HttpError.forbidden);

    final future = sut.load(page: page, seed: seed);

    expect(future, throwsA(HttpError.forbidden));
  });

  test('should throw NotFound if client return 404', () async {
    mockHttpError(HttpError.notFound);

    final future = sut.load(page: page, seed: seed);

    expect(future, throwsA(HttpError.notFound));
  });

  test('should throw ServerError if client return 500', () async {
    mockHttpError(HttpError.serverError);

    final future = sut.load(page: page, seed: seed);

    expect(future, throwsA(HttpError.serverError));
  });
}
