List<Vehicle> vehicleListFromJson(List<dynamic> vehicleJson) =>
    List<Vehicle>.from(vehicleJson
        .map((vehicleJsonList) => Vehicle.fromJson(vehicleJsonList)));

class Vehicle {
  int? id;
  int? userId;
  int? categoryId;
  String? vehicleName;
  String? brandName;
  String? color;
  String? mileage;
  String? image;
  String? trasmissionType;
  String? seat;
  String? vehicleNumber;
  String? status;
  String? fuelType;
  String? vehicleDescription;
  int? costPerHour;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Vehicle(
      {this.id,
      this.userId,
      this.categoryId,
      this.vehicleName,
      this.brandName,
      this.color,
      this.mileage,
      this.image,
      this.trasmissionType,
      this.seat,
      this.vehicleNumber,
      this.status,
      this.fuelType,
      this.vehicleDescription,
      this.costPerHour,
      this.createdAt,
      this.updatedAt,
      this.imageUrl});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    vehicleName = json['vehicle_name'];
    brandName = json['brand_name'];
    color = json['color'];
    mileage = json['mileage'];
    image = json['image'];
    trasmissionType = json['trasmission_type'];
    seat = json['seat'];
    vehicleNumber = json['vehicle_number'];
    status = json['status'];
    fuelType = json['fuel_type'];
    vehicleDescription = json['vehicle_description'];
    costPerHour = json['cost_per_hour'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    data['vehicle_name'] = vehicleName;
    data['brand_name'] = brandName;
    data['color'] = color;
    data['mileage'] = mileage;
    data['image'] = image;
    data['trasmission_type'] = trasmissionType;
    data['seat'] = seat;
    data['vehicle_number'] = vehicleNumber;
    data['status'] = status;
    data['fuel_type'] = fuelType;
    data['vehicle_description'] = vehicleDescription;
    data['cost_per_hour'] = costPerHour;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}
