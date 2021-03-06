class Setting {
  String title;
  String slug;
  String description;

  Setting({this.title, this.slug, this.description});

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      title: json['title'],
      description: json['description'],
      slug: json['slug'],
    );
  }
}
