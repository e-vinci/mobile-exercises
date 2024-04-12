class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    this.id = -1,
    this.title = "no title",
    this.url = "no url",
    this.thumbnailUrl = "no thumbnail",
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'] ?? "",
      title: json['title'] ?? "",
      url: json['url'] ?? "",
      thumbnailUrl: json['thumbnailUrl'] ?? "",
    );
  }
}
