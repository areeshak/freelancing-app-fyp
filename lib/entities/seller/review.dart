class Review {
  String username;
  DateTime dateTime;
  double rating;
  String service = '';
  String imagePath;
  String review;

  Review({
    required this.username,
    required this.dateTime,
    required this.imagePath,
    required this.rating,
    required this.review,
  });
}
