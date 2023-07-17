import 'package:node/l10n/l10n.dart';
import 'package:node/src/utils/context_holder.dart';
import 'package:flutter/material.dart';

class NoInternetSnackBar extends SnackBar {
  NoInternetSnackBar({
    super.key,
  }) : super(
          backgroundColor:
              Theme.of(ContextHolder.currentContext).colorScheme.error,
          content: Text(ContextHolder.currentContext.l10n.turnOnInternet),
        );
}
