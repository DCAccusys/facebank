import 'package:facebank/src/data/models/request/get_initial_configuration_request.dart';
import 'package:facebank/src/data/models/response/get_initial_configuration_response.dart';

abstract class IConfigurationRepository {
  // Require an idenfifierRequest Body
  Future<InitialConfifurationResponse?> getInitialConfiguration(
      InitialConfifurationRequest request);
}
