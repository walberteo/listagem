import 'dart:convert';
import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../shared/utils/http_erros.dart';
import 'models/user_model.dart';
import 'repositories/user_repository.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final UserRepository repository;

  var _page = 1;
  String _seed;

  @observable
  List<UserModel> users;

  @observable
  bool isloading = true;

  @observable
  bool hasError = false;

  _HomeControllerBase(this.repository) {
    _seed = _getRandString(5);
    fetchUsers();
  }

  @action
  fetchUsers() async {
    try {
      hasError = false;
      _page = 1;
      _seed = _getRandString(5);
      users = await repository.load(page: _page, seed: _seed);
    } on HttpError catch (e) {
      print(e);
      hasError = true;
    } finally {
      Future.delayed(Duration(milliseconds: 300), () => isloading = false);
    }
  }

  @action
  fetchNextUsers() async {
    try {
      hasError = false;
      _page++;
      var newUsers = users;
      newUsers.addAll(await repository.load(page: _page, seed: _seed));
      users = newUsers;
    } on HttpError catch (e) {
      print(e);
      hasError = true;
    }
  }

  String _getRandString(int len) {
    var random = Random.secure();
    var values = List<int>.generate(len, (i) => random.nextInt(255));
    return base64UrlEncode(values);
  }
}
