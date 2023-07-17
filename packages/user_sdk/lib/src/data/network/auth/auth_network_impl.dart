import 'package:dartz/dartz.dart';
import 'package:user_sdk/src/data/config/network_config.dart';
import 'package:user_sdk/src/domain/models/exports.dart';
import 'package:user_sdk/src/domain/networks/auth_network.dart';
import 'package:user_sdk/src/domain/repositories/auth_repository.dart';
import 'package:user_sdk/src/domain/user_get_it.dart';
import 'apis/exports.dart';
import 'apis/logout/logout_api.dart';
import 'default_imports.dart';

class AuthNetworkImpl extends AuthNetwork {
  final NetworkConfig networkConfig;

  AuthRepository get repo => UserSdkGetIt.shared.get();

  AuthNetworkImpl(this.networkConfig);

  @override
  Future<Either<FailureModel, DeviceRegisterResponseModel>> registerDevice(
    DeviceInfoModel data,
  ) =>
      DeviceRegisterApi(networkConfig).call(data);

  @override
  Future<Either<FailureModel, bool>> isSessionValid() =>
      CheckSessionValidApi(networkConfig).call();

  @override
  Future<Either<FailureModel, EmptyModel>> logout() =>
      LogoutApi(networkConfig).call();

  @override
  Future<Either<FailureModel, String>> firebaseLogin(String idToken) =>
      FirebaseLoginApi(networkConfig).call(idToken);
}
