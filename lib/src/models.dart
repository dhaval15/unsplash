class Collection {
  final String id;
  final String title;

  Collection({this.id, this.title});
}

class Photo {
  final String id;
  final int width;
  final int height;
  final String color;
  final String description;
  final String altDescription;
  final dynamic urls;

  Photo({
    this.altDescription,
    this.id,
    this.width,
    this.height,
    this.color,
    this.description,
    this.urls,
  });

  factory Photo.fromJson(dynamic json) => Photo(
        id: json['id'],
        width: json['width'],
        height: json['height'],
        color: json['color'],
        description: json['description'],
        altDescription: json['alt_description'],
        urls: json['urls'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'width': width,
        'height': height,
        'color': color,
        'description': description,
        'urls': urls,
      };
}

