import 'package:flutter/widgets.dart';

import 'cupertino_modal_sheet_route.dart';

Future<T?> showCupertinoModalSheet<T>(
    {required BuildContext context,
    required WidgetBuilder builder,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
    bool fullscreenDialog = true,
    bool barrierDismissible = true,
    CupertinoModalSheetRouteTransition firstTransition =
        CupertinoModalSheetRouteTransition.none}) {
  return Navigator.of(context, rootNavigator: useRootNavigator).push(
    CupertinoModalSheetRoute<T>(
      builder: builder,
      settings: routeSettings,
      fullscreenDialog: fullscreenDialog,
      barrierDismissible: barrierDismissible,
      firstTransition: firstTransition,
    ),
  );
}

class CupertinoModalSheetPage<T> extends Page<T> {
  final Widget child;
  final CupertinoModalSheetRouteTransition firstTransition;

  const CupertinoModalSheetPage({
    super.key,
    required this.child,
    super.name,
    super.arguments,
    super.restorationId,
    this.firstTransition = CupertinoModalSheetRouteTransition.none,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return CupertinoModalSheetRoute<T>(
      builder: (_) => child,
      settings: this,
      firstTransition: firstTransition,
    );
  }
}
