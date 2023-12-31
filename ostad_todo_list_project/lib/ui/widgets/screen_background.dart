import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_todo_list_project/ui/utils/AssetsUtils.dart';

class ScreenBackground extends StatelessWidget {

  final Widget child;

  const ScreenBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SvgPicture.asset(
          AssetsUtils.bgSVG,
          fit: BoxFit.cover,
        ),
      ),
      SafeArea(child: child)
    ]);
  }
}