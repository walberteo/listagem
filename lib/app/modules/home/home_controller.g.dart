// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<UserRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$usersAtom = Atom(name: '_HomeControllerBase.users');

  @override
  List<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$isloadingAtom = Atom(name: '_HomeControllerBase.isloading');

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  final _$hasErrorAtom = Atom(name: '_HomeControllerBase.hasError');

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  final _$fetchUsersAsyncAction = AsyncAction('_HomeControllerBase.fetchUsers');

  @override
  Future fetchUsers() {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers());
  }

  final _$fetchNextUsersAsyncAction =
      AsyncAction('_HomeControllerBase.fetchNextUsers');

  @override
  Future fetchNextUsers() {
    return _$fetchNextUsersAsyncAction.run(() => super.fetchNextUsers());
  }

  @override
  String toString() {
    return '''
users: ${users},
isloading: ${isloading},
hasError: ${hasError}
    ''';
  }
}
