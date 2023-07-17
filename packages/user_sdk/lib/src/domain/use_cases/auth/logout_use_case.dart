import 'package:core_sdk/exports.dart';
import 'package:dartz/dartz.dart';
import 'package:user_sdk/src/domain/models/exports.dart';
import 'package:user_sdk/src/domain/user_get_it.dart';

import '../../networks/auth_network.dart';
import '../../repositories/auth_repository.dart';

class LogoutUseCase {
  AuthNetwork get network => UserSdkGetIt.shared.get();
  AuthRepository get repository => UserSdkGetIt.shared.get();

  LogoutUseCase();

  Future<Either<FailureModel, EmptyModel>> call() async {
    final resultFuture = network.logout();
    final model = repository.getAppAuthModel();
    await repository.clear();
    await repository.setAppAuthModel(AppAuthModel(device: model.device));
    await resultFuture;
    return Right(EmptyModel());
  }
}
