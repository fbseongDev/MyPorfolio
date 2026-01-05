import 'package:design_system/src/components/text/text.dart';
import 'package:design_system/src/foundation/border_radius.dart';
import 'package:design_system/src/foundation/colors.dart';
import 'package:design_system/src/foundation/text_style.dart';
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

  final int columnIndex;
  final int columnLength;
  final List<bool> parentIsLasts;
  final List<String> logs;

  const _PackageTree({
    super.key,
    required this.node,
    this.depth = 0,
    this.columnIndex = 0,
    this.columnLength = 1,
    this.parentIsLasts = const [],

    this.logs = const ['  '],
  });

  @override
  m.Widget build(m.BuildContext context) {
    return m.Column(
      crossAxisAlignment: m.CrossAxisAlignment.start,
      children: [
        m.Row(
          children: [
            m.Row(
              children: List.generate(depth, (index) {
                return [
                  if (parentIsLasts[index])
                    Text(
                      '│',
                      style: TextStyle(color: Colors.lightGray.withAlpha(100)),
                    ),
                  m.SizedBox(width: 16),
                ];
              }).expand((e) => e).toList(),
            ),

            if (depth > 0)
              Text(
                (columnLength - 1) == columnIndex ? '└' : '├',
                style: TextStyle(color: Colors.lightGray.withAlpha(100)),
              ),
            m.Icon(
              node.isFolder ? m.Icons.folder : m.Icons.insert_drive_file,
              size: 16,
              color: node.isFolder ? Colors.blue : Colors.lightGray,
            ),
            const m.SizedBox(width: 8),
            m.Text(node.name),
          ],
        ),

        if (node.isFolder)
          m.Column(
            children: node.children!
                .asMap()
                .entries
                .map(
                  (entry) => _PackageTree(
                    node: entry.value,
                    depth: depth + 1,
                    columnIndex: entry.key,
                    columnLength: node.children!.length,
                    parentIsLasts: [
                      ...parentIsLasts,
                      (columnLength - 1) != columnIndex,
                    ],
                    logs: [...logs, '(${columnLength - 1}) != $columnIndex'],
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}
