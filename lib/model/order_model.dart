class Order {
  final int? id;
  final ClientEquipment clientEquipment;
  final ServiceType typeService;
  final OrderStatus? orderStatus;
  final Worker? worker;
  final String dateOrder;

  Order({
    required this.id,
    required this.clientEquipment,
    required this.typeService,
    required this.orderStatus,
    required this.worker,
    required this.dateOrder,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as int,
      clientEquipment: ClientEquipment.fromJson(json['clientEquipment']),
      typeService: ServiceType.fromJson(json['typeService']),
      orderStatus: OrderStatus.fromJson(json['orderStatus']),
      worker: json['worker'] != null ? Worker.fromJson(json['worker']) : null,
      dateOrder: json['DateOrder'] as String,
    );
  }
}

class ClientEquipment {
  final int? id;
  final String name;
  final String typeEquipment;

  ClientEquipment({
    required this.id,
    required this.name,
    required this.typeEquipment,
  });

  factory ClientEquipment.fromJson(Map<String, dynamic> json) {
    return ClientEquipment(
      id: json['id'] as int,
      name: json['name'] as String,
      typeEquipment: json['typeEquipment'] as String,
    );
  }
}

class ServiceType {
  final int id;
  final String name;

  ServiceType({
    required this.id,
    required this.name,
  });

  factory ServiceType.fromJson(Map<String, dynamic> json) {
    return ServiceType(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}

class OrderStatus {
  final int id;
  final String name;

  OrderStatus({
    required this.id,
    required this.name,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> json) {
    return OrderStatus(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}

class Worker {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;

  Worker({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  factory Worker.fromJson(Map<String, dynamic> json) {
    return Worker(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phone: json['phone'] as String,
    );
  }
}