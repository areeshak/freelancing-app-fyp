class Project {
  String title;
  String description = '';
  String path = '';

  Project(
    this.description,
    this.path, {
    required this.title,
  });
}
