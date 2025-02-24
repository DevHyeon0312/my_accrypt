import 'package:flutter/cupertino.dart';
import 'package:my_accrypt/common/utils/debug_log.dart';

class SafetyNavigator {
  static Map<String, dynamic> getArgs(BuildContext context) {
    if (ModalRoute.of(context)?.settings.arguments == null) {
      DebugLog.e('Check Route Settings Arguments..');
      return <String, dynamic>{};
    }
    var routeName = ModalRoute.of(context)?.settings.name ?? '[ Check Route Settings Arguments.. ]';
    try {
      return ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    } on TypeError catch (typeError) {
      DebugLog.e('$routeName >> TypeError : $typeError >> My App Arguments only support Map<String, dynamic>');
      return <String, dynamic>{};
    } catch (e) {
      DebugLog.e('$routeName >> error : $e');
      return <String, dynamic>{};
    }
  }

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
