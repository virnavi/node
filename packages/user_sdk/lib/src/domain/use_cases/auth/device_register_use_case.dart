import 'package:core_sdk/exports.dart';
import 'package:dartz/dartz.dart';
import 'package:user_sdk/src/domain/models/exports.dart';
import 'package:user_sdk/src/domain/user_get_it.dart';

import '../../networks/auth_network.dart';
import '../../repositories/auth_repository.dart';

class DeviceRegisterUseCase {
  AuthNetwork get network => UserSdkGetIt.shared.get();

  AuthRepository get repository => UserSdkGetIt.shared.get();

  DeviceRegisterUseCase();

  Future<Either<FailureModel, bool>> call(DeviceInfoModel data) async {
    if (!await _isDeviceRegistered(data)) {
      return await _registerDevice(data);
    }
    return const Right(true);
  }

  Future<Either<FailureModel, bool>> _registerDevice(
      DeviceInfoModel data) async {
    print('<<>> _registerDevice ');
    final result = await network.registerDevice(data);
    return await result.fold((failure) async => Left(failure),
        (deviceData) async {
      await repository.setAppAuthModel(
        AppAuthModel(
          device: AppDeviceInfoModel(
            deviceId: deviceData.id,
            deviceType: data.deviceType,
            deviceData: data.deviceData,
            fingerprint: deviceData.fingerprint,
          ),
        ),
      );

      return const Right(true);
    });
  }

  Future<bool> _isDeviceRegistered(DeviceInfoModel data) async {
    final model = repository.getAppAuthModel();
    final empty = AppAuthModel.empty();
    return empty.device.deviceType != model.device.deviceType &&
        empty.device.deviceData != model.device.deviceData &&
        model.device.deviceType == data.deviceType &&
        model.device.deviceData == data.deviceData &&
        model.device.fingerprint.isNotEmpty;
  }
}
