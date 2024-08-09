import 'package:flutter/widgets.dart';

class PagesConfigs {
  final double viewHeight;
  final double viewWidth;

  PagesConfigs(BuildContext context)
      : viewHeight = MediaQuery.of(context).size.height,
        viewWidth = MediaQuery.of(context).size.width;
}
