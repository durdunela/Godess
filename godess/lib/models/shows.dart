class Show {
  final String? title;
  final String? postTitle;
  final String? description;
  final List<String>? videoLinks;
  final String? imageUrl;

  Show({
    this.title,
    this.postTitle,
    this.description,
    this.videoLinks,
    this.imageUrl,
  });

  factory Show.fromJson(Map<String, dynamic> json) {
    return Show(
      title: json['title'] as String?,
      postTitle: json['postTitle'] as String?,
      description: json['description'] as String?,
      videoLinks: (json['videoLinks'] as List<dynamic>?)
          ?.map((link) => link as String)
          .toList(),
      imageUrl: json['imageUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'postTitle': postTitle,
      'description': description,
      'videoLinks': videoLinks,
      'imageUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return 'Show{title: $title, postTitle: $postTitle, description: $description, videoLinks: $videoLinks, imageUrl: $imageUrl}';
  }
}
