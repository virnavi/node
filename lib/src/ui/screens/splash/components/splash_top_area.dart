import 'package:node/l10n/l10n.dart';
import 'package:node/src/constants/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:styles/constants/style_dimens.dart';
import 'package:styles/styles.dart';

class SplashTopArea extends StatelessWidget {
  const SplashTopArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.only(
        top: AppDimens.splashTopSpacing,
        bottom: StyleDimens.screenEdgeHeightOffset,
        left: StyleDimens.screenEdgeWidthOffset,
        right: StyleDimens.screenEdgeWidthOffset,
      ),
      padding: EdgeInsets.all(StyleDimens.screenEdgeWidthOffset),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background.withOpacity(0.4),
        borderRadius: BorderRadius.circular(StyleDimens.roundedCornerRadius),
      ),
      child: ThemeTexts.primary.displaySmall(
        context: context,
        text: context.l10n.appName,
        textAlign: TextAlign.center,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
