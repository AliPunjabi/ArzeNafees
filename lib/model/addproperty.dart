class Addproperty {
  final String? id;
  final String title;
  final String type;
  final String subtype;
  final String city;
  final String area;
  final String price;
  final String description;
  final String contact;
  final String size;
  final String unit;
  final String category;

  const Addproperty(
      {required this.id,
      required this.title,
      required this.area,
      required this.city,
      required this.contact,
      required this.description,
      required this.price,
      required this.subtype,
      required this.size,
      required this.unit,
      required this.category,
      required this.type});

  factory Addproperty.fromJson(Map<String, dynamic> json) {
    return Addproperty(
        id: json['id'],
        title: json['property_title'],
        area: json['location_area'],
        city: json['location_city'],
        contact: json['contact_number'],
        description: json['property_description'],
        price: json['property_price'],
        subtype: json['property_subtype'],
        size: json['size'],
        unit: json['unit'],
        category: json['property_category'],
        type: json['property_type']);
  }
}
