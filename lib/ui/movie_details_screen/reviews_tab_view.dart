import 'package:flutter/material.dart';

import '../../model/api_model/movies_details/ReviewModel.dart';
import '../components/review_item.dart';

class ReviewsTabView extends StatelessWidget {
  ReviewModel reviewModel;
  ReviewsTabView({required this.reviewModel});
  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(children: [
            Text(
              "Reviews",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ]),
          ReviewItem(review: reviewModel.results![0]!),
        ],
      ),
    );
  }
}
