import 'package:node/l10n/l10n.dart';
import 'package:node/src/utils/context_holder.dart';
import 'package:node/src/utils/internet_utils.dart';
import 'package:node/styles/dialogs/turn_on_internet_dialog.dart';
import 'package:flutter/material.dart';

import '../init_phase.dart';
import 'base_task_cubit.dart';

class AutoLoginTaskCubit extends BaseTaskCubit {
  BuildContext get context => ContextHolder.currentContext;

  @override
  Future<void> doWork() async {
    Future.delayed(const Duration(milliseconds: 10), () {
      emit(state.copyWith(
        phase: InitPhase.completed,
      ));
    });
  }

}
