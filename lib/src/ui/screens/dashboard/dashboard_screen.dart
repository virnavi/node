import 'package:node/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:styles/constants/exports.dart';
import 'package:styles/styles.dart';

import 'dashboard_listener.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardListener listener = DashboardListener();

  static Future<void> navigate(
    BuildContext context, {
    bool replace = false,
  }) async {
    final route = MaterialPageRoute(builder: (_) => DashboardScreen());
    if (replace) {
      await Navigator.of(context, rootNavigator: true).pushReplacement(route);
    } else {
      await Navigator.of(context, rootNavigator: true).push(route);
    }
  }

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return const DashboardContent();
  }
}

class DashboardContent extends StatefulWidget {
  const DashboardContent({super.key});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Screen(
      allowBack: false,
      appBar: AppBar(
        title: Text(context.l10n.appName),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Placeholder(),
    );
  }

  Container _buildOldDataText(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(StyleDimens.screenEdgeWidthOffset),
      padding: EdgeInsets.all(StyleDimens.screenEdgeWidthOffset),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background.withOpacity(0.8),
        borderRadius: BorderRadius.circular(StyleDimens.roundedCornerRadius),
      ),
      child: ThemeTexts.onBackground.labelLarge(
        context: context,
        text: context.l10n.dashboardOldData,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
