import 'package:flutter/cupertino.dart';

@immutable
final class PackageNode {
  final String name;
  final List<PackageNode>? _children;

  const PackageNode({required this.name, List<PackageNode>? children})
    : _children = children;

  List<PackageNode>? get children {
    if (_children == null) return null;

    return _children.toList()
      ..sort((a, b) {
        final aHasChildren = a._children != null;
        final bHasChildren = b._children != null;

        if (aHasChildren == bHasChildren) {
          return a.name.compareTo(b.name);
        }

        return aHasChildren ? -1 : 1;
      });
  }
}
