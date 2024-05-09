class Equipment {
  final int? id;
  String name;
  EquipmentType typeEquipment;
  String company;
  String description;

  Equipment({
    required this.id,
    required this.name,
    required this.typeEquipment,
    required this.company,
    required this.description,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      id: json['id'] as int,
      name: json['Name'] as String,
      typeEquipment: EquipmentType.fromJson(json['typeEquipment']),
      company: json['Company'] as String,
      description: json['Description'] as String,
    );
  }
}

class EquipmentType {
  final int id;
  final String type;
  final String description;

  EquipmentType({
    required this.id,
    required this.type,
    required this.description,
  });

  factory EquipmentType.fromJson(Map<String, dynamic> json) {
    return EquipmentType(
      id: json['id'] as int,
      type: json['type'] as String,
      description: json['description'] as String,
    );
  }
}