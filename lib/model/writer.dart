class Writer {
  int? id;
  String? name;
  String? image_url;

  Writer(
      {this.id,
        this.name,
        this.image_url});

  Writer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image_url = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image_url'] = this.image_url;
    return data;
  }

  Writer.fromMap(Map<String, dynamic> map) {
    id = map['book_id'];
    name = map['name'];
    image_url = map['image_url'];
  }

  Map<String, dynamic> toMap() {
    return {
      'book_id': id,
      'name': name,
      'image_url': image_url,
    };
  }


}
