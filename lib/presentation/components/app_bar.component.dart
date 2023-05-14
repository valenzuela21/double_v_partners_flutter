import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar AppBarComponent() {
  return AppBar(
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: SvgPicture.asset(
      "assets/images/dvp-logo.svg",
      height: 30.0,
      width: 30.0,
      allowDrawingOutsideViewBox: true,
    ),
  );
}
