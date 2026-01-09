import 'package:convention/ui.dart';

class ArchitectureExplainFiled extends HookWidget {
  final String title;
  final Widget field;

  const ArchitectureExplainFiled._({
    super.key,
    required this.title,
    required this.field,
  });

  factory ArchitectureExplainFiled.content({
    required final String title,
    required final String content,
  }) {
    return ArchitectureExplainFiled._(title: title, field: Text(content));
  }

  factory ArchitectureExplainFiled.builder({
    required final String title,
    required final WidgetBuilder builder,
  }) {
    return ArchitectureExplainFiled._(
      title: title,
      field: Builder(builder: builder),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12),
        Container(padding: EdgeInsets.all(16), child: field),
      ],
    );
  }
}
