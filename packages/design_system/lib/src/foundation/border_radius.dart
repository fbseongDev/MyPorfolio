import 'package:flutter/material.dart' as  m;

abstract final class BorderRadius {

  static _AllBorderRadiusValues all = _AllBorderRadiusValues();
}

 class _AllBorderRadiusValues {
  m.BorderRadius max = m.BorderRadius.all(m.Radius.circular(100));
  m.BorderRadius normal = m.BorderRadius.all(m.Radius.circular(32));
}



