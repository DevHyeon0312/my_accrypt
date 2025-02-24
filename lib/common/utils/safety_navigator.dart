import 'package:flutter/cupertino.dart';

class SafetyNavigator {
  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    if (context.mounted && Navigator.canPop(context)) {
      Navigator.pop(context, result);
    }
  }

  static void popUntil(BuildContext context, RoutePredicate predicate) {
    if (context.mounted && Navigator.canPop(context)) {
      Navigator.popUntil(context, predicate);
    }
  }

  static Future<T?> pushNamed<T extends Object?>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    if (!context.mounted) {
      return Future.value(null);
    }
    return Navigator.of(context).pushNamed<T>(routeName, arguments: arguments);
  }

  static Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    BuildContext context,
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    if (!context.mounted) {
      return Future.value(null);
    }
    return Navigator.of(context).pushReplacementNamed<T, TO>(routeName,
        arguments: arguments, result: result);
  }

  static Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    BuildContext context,
    String newRouteName,
    RoutePredicate predicate, {
    Object? arguments,
  }) {
    if (!context.mounted) {
      return Future.value(null);
    }
    return Navigator.of(context).pushNamedAndRemoveUntil<T>(
        newRouteName, predicate,
        arguments: arguments);
  }
}
