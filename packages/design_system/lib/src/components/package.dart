import 'package:design_system/src/foundation/border_radius.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:flutter/material.dart' as m;

import '../util/package_node.dart';

class Package extends m.StatelessWidget {
  final PackageNode node;

  const Package({super.key, required this.node});

  @override
  m.Widget build(m.BuildContext context) {
    return m.Container(
      padding: const m.EdgeInsets.all(16),
      decoration: m.BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.all.normal,
      ),
      child: _PackageTree(node: node),
    );
  }
}

class _PackageTree extends m.StatelessWidget {
  final PackageNode node;
  final int depth;

  const _PackageTree({
    super.key,
    required this.node,
    this.depth = 0,
  });

  bool get isFolder => node.children != null && node.children!.isNotEmpty;

  @override
  m.Widget build(m.BuildContext context) {
    return m.Column(
      crossAxisAlignment: m.CrossAxisAlignment.start,
      children: [
        m.Stack(
          children: [
            // 세로 트리 라인
            if (depth > 0)
              m.Positioned(
                left: depth * 16 - 8,
                top: 0,
                bottom: 0,
                child: m.Container(
                  width: 1,
                  color: Colors.lightGray.withOpacity(0.4),
                ),
              ),

            // 실제 콘텐츠
            m.Padding(
              padding: m.EdgeInsets.only(left: depth * 16),
              child: m.Row(
                children: [
                  // 가로 분기 라인
                  if (depth > 0)
                    m.Container(
                      width: 8,
                      height: 1,
                      color: Colors.lightGray.withOpacity(0.4),
                    ),
                  m.Icon(
                    isFolder
                        ? m.Icons.folder
                        : m.Icons.insert_drive_file,
                    size: 16,
                    color:
                    isFolder ? Colors.blue : Colors.lightGray,
                  ),
                  const m.SizedBox(width: 8),
                  m.Text(
                    node.name,
                    style: const m.TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        if (isFolder)
          m.Column(
            children: node.children!
                .map(
                  (child) => _PackageTree(
                node: child,
                depth: depth + 1,
              ),
            )
                .toList(),
          ),
      ],
    );
  }
}
