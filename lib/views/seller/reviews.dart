import 'package:flutter/material.dart';
import '../../entities/seller/review.dart';

class ReviewsTab extends StatelessWidget {
  List<Review> reviews;
  ReviewsTab({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: reviews.isEmpty
            ? Text(
                'No reviews added',
                style: Theme.of(context).textTheme.displaySmall,
              )
            : Text('Reviews Tab'),
      ),
    );
  }
}
