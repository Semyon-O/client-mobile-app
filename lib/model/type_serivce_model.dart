class ServiceTypeModel {
  final int id;
  final String name;

  ServiceTypeModel({
    required this.id,
    required this.name,
  });

  factory ServiceTypeModel.fromJson(Map<String, dynamic> json) {
    return ServiceTypeModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}