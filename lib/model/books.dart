import 'writer.dart';

class Books {
  int? id;
  String? title;
  String? image_url;
  String? genre;
  String? description;
  int? price;
  Writer? writer;

  Books(
      {this.id,
        this.title,
        this.image_url,
        this.genre,
        this.description,
        this.price,
        this.writer});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image_url = json['image_url'];
    genre = json['genre'];
    description = json['description'];
    price = json['price'];
    writer = json['writer'] != null ? Writer.fromJson(json['writer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.image_url;
    data['genre'] = this.genre;
    data['description'] = this.description;
    data['price'] = this.price;
    data['writer'] = this.writer;
    return data;
  }

  Books.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    image_url = map['image_url'];
    genre = map['genre'];
    description = map['description'];
    price = map['price'];
    writer = map['writer'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image_url': image_url,
      'genre': genre,
      'description': description,
      'price': price,
      'writer': writer,
    };
  }


}
