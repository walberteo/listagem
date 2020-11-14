import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../shared/utils/http_erros.dart';
import '../models/user_model.dart';
import '../usecases/load_users.dart';

class UserRepository implements LoadUsers {
  final Dio dio;

  UserRepository(this.dio);

  @override
  Future<List<UserModel>> load(
      {@required int page, @required String seed}) async {
    var response = Response(data: '', statusCode: 500);
    try {
      response = await dio.get('?page=$page&nat=br&results=10&seed=$seed');
      var list = _handleResponse(response);
      if (list != null)
        return list.map((user) => UserModel.fromJson(user)).toList();
    } on HttpError catch (e) {
      throw e;
    } catch (e) {
      print(e);
      throw HttpError.serverError;
    }

    return null;
  }

  List _handleResponse(Response response) {
    if (response.statusCode == 200) {
      return response.data.isEmpty
          ? null
          : (jsonDecode(response.data)['results'] as List);
    } else if (response.statusCode == 204) {
      return null;
    } else if (response.statusCode == 400) {
      throw HttpError.badRequest;
    } else if (response.statusCode == 401) {
      throw HttpError.unauthorized;
    } else if (response.statusCode == 403) {
      throw HttpError.forbidden;
    } else if (response.statusCode == 404) {
      throw HttpError.notFound;
    } else {
      throw HttpError.serverError;
    }
  }
}
