import 'package:core_sdk/core_sdk.dart';
import 'package:core_sdk/data/config/auth_network_config.dart';
import 'package:node/env/env.dart';

import '../init_phase.dart';
import 'base_task_cubit.dart';

class InitCoreSdkTaskCubit extends BaseTaskCubit {
  @override
  Future<void> doWork() async {
    try {
      await CoreSdk.initialize(
          networkConfig: NetworkConfig(
        baseUrl: Env.shared.networkBaseUrl,
        useMock: Env.shared.useMockApi,
        appId: Env.shared.appId,
      ));

      Future.delayed(const Duration(milliseconds: 10), () {
        emit(
          state.copyWith(phase: InitPhase.completed),
        );
      });
    } on Exception catch (e) {
      Future.delayed(const Duration(milliseconds: 10), () {
        emit(
          state.copyWith(
            phase: InitPhase.error,
            message: e.toString(),
          ),
        );
      });
    }
  }
}
