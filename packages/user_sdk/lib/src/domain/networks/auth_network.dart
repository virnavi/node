import 'package:core_sdk/exports.dart';
import 'package:dartz/dartz.dart';
import 'package:user_sdk/src/domain/models/exports.dart';


abstract class AuthNetwork {
  Future<Either<FailureModel, String>> firebaseLogin(String idToken);
  Future<Either<FailureModel, DeviceRegisterResponseModel>> registerDevice(DeviceInfoModel data);
  Future<Either<FailureModel, bool>> isSessionValid();
  Future<Either<FailureModel, EmptyModel>> logout();
}
