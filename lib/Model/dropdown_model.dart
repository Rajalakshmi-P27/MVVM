class DropdownModel {
  final List<String> items;
  final String heading;
  final String required;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  const DropdownModel({
    required this.heading,
    required this.required,
    required this.items,
    required this.validator,
    required this.onChanged,
  });
}
