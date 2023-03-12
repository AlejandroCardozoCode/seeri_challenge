class ReviewModel {
  ReviewModel({
    required this.author,
    required this.authorDetails,
    required this.content,
    required this.createdAt,
    required this.id,
    required this.updatedAt,
    required this.url,
  });

  String author;
  AuthorDetails authorDetails;
  String content;
  String createdAt;
  String id;
  String updatedAt;
  String url;

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        author: json["author"],
        authorDetails: AuthorDetails.fromJson(json["author_details"]),
        content: json["content"],
        createdAt: (json["created_at"]),
        id: json["id"],
        updatedAt: (json["updated_at"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "author_details": authorDetails.toJson(),
        "content": content,
        "created_at": createdAt,
        "id": id,
        "updated_at": updatedAt,
        "url": url,
      };
}

class AuthorDetails {
  AuthorDetails({
    required this.name,
    required this.username,
    this.avatarPath,
    this.rating,
  });

  String name;
  String username;
  String? avatarPath;
  double? rating;

  factory AuthorDetails.fromJson(Map<String, dynamic> json) => AuthorDetails(
        name: json["name"],
        username: json["username"],
        avatarPath: json["avatar_path"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "avatar_path": avatarPath,
        "rating": rating,
      };

  get getFullPathImagePoster {
    if (avatarPath == null) {
      return "http://via.placeholder.com/640x360";
    } else if (avatarPath!.contains("http")) {
      return avatarPath!.replaceAll("/http", "http");
    }
    return "https://image.tmdb.org/t/p/w500$avatarPath";
  }
}
