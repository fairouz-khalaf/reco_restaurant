import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsetsGeometry appPadding = EdgeInsets.symmetric(
  horizontal: 20.W,
  vertical: 15.H,
);
EdgeInsetsGeometry appContainerPadding = const EdgeInsets.all(5);

extension CustomPadding on Widget {
  addAllPadding(double val) =>
      Padding(padding: EdgeInsets.all(val), child: this);

  addSymmetricPadding({double? hVal, double? vVal}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: hVal ?? 0, vertical: vVal ?? 0),
    child: this,
  );

  addOnlyPadding({double? tVal, double? bVal, double? lVal, double? rVal}) =>
      Padding(
        padding: EdgeInsets.only(
          top: tVal ?? 0,
          bottom: bVal ?? 0,
          left: lVal ?? 0,
          right: rVal ?? 0,
        ),
        child: this,
      );
}

extension EmptyPadding on num {
  SizedBox get pH => SizedBox(height: toDouble());

  SizedBox get pW => SizedBox(width: toDouble());
}

extension SizeExtension on num {
  double get W => ScreenUtil().setWidth(this);

  double get H => ScreenUtil().setHeight(this);
}

extension Navigation on BuildContext {
  Future<dynamic> push(Widget page) async {
    Navigator.push(this, MaterialPageRoute(builder: (_) => page));
  }

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
