import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Models/user_registration.dart';
import '../entity/app_user.dart';
import '../helpers/shared_preferences_utils.dart';
import '../helpers/utils.dart';
import '../remote/firebase_auth_source.dart';
import '../remote/firebase_database_source.dart';
import '../remote/response.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseAuthSource _authSource = FirebaseAuthSource();
  final FirebaseDatabaseSource _databaseSource = FirebaseDatabaseSource();

  bool isLoading = false;
  AppUser? _user;

  Future<AppUser?> get user => _getUser();

  Future<Response> loginUser(String email, String password, context) async {
    Response<dynamic> response = await _authSource.signIn(email, password);
    if (response is Success<UserCredential>) {
      String id = response.value.user!.uid;
      SharedPreferencesUtil.setUserId(id);
    } else if (response is Error) {
      showSnackBar(response.message, context);
    }
    return response;
  }

  Future<Response> registerUser(
      UserRegistration userRegistration, context) async {
    Response<dynamic> response = await _authSource.register(
        userRegistration.email, userRegistration.password);
    if (response is Success<UserCredential>) {
      String id = response.value.user!.uid;

      AppUser user = AppUser(
        id: id,
        username: userRegistration.username,
        email: userRegistration.email,
        city: userRegistration.city,
        number: userRegistration.number,
      );
      _databaseSource.addUser(user);
      SharedPreferencesUtil.setUserId(id);
      _user = _user;
      return Response.success(user);
    }
    if (response is Error) {
      showSnackBar('$response.message', context);
    }
    return response;
  }

  Future<AppUser?> _getUser() async {
    String? id = await SharedPreferencesUtil.getUserId();
    _user = AppUser.fromSnapshot(await _databaseSource.getUser(id));
    return _user;
  }

  Future<void> logoutUser() async {
    notifyListeners();
    await SharedPreferencesUtil.removeUserId();
    notifyListeners();
  }
}
