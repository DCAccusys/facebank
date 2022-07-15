import 'package:facebank/src/data/models/request/auth_login_request.dart';
import 'package:facebank/src/data/models/response/auth_login_response.dart';

abstract class AuthRepository{
  Future<AuthLoginResponse> doLogin(AuthLoginRequest loginRequest);
}