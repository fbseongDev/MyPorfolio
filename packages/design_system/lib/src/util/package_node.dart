import 'package:flutter/cupertino.dart';

@immutable
final class PackageNode {
  final String name;
  final List<PackageNode>? children;

  const PackageNode({
    required this.name,
    this.children,
  });
}