import 'package:facebank/src/data/models/request/get_image_alias_request.dart';
import 'package:facebank/src/data/models/request/login_request.dart';
import 'package:facebank/src/data/models/request/validate_existing_alias_request.dart';
import 'package:facebank/src/data/models/request/validate_image_alias_request.dart';
import 'package:facebank/src/data/models/response/login_response.dart';
import 'package:facebank/src/data/models/response/validate_image_alias_response.dart';

import '../../data/models/response/get_image_alias_response.dart';

abstract class ISecurityRepository {
  Future<LoginResponse?> login(LoginRequest request);
  Future<ValidateExistingAliasResponse?> validateExistingAlias(
      ValidateExistingAliasRequest request);
  Future<GetImageAliasResponse?> getImageAlias(GetImageAliasRequest request);
  Future<void> validateImagenAlias(ValidateImagenAliasRequest request);
}
