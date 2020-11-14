import 'package:meta/meta.dart';

import '../models/user_model.dart';

abstract class LoadUsers {
  Future<List<UserModel>> load({
    @required int page,
    @required String seed,
  });
}
