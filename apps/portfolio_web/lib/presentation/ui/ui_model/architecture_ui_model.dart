import 'package:convention/model.dart';

@immutable
final class ArchitectureUiModel {
  final String name;
  final String description;

  final Widget detailPage;

  const ArchitectureUiModel({
    required this.name,
    required this.description,
    required this.detailPage,
  });
}
