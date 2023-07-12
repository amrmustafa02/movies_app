import 'package:flutter/material.dart';

import '../../model/api_model/movies_details/ReviewModel.dart';
import '../components/review_item.dart';

class ReviewsTabView extends StatelessWidget {
  ReviewModel reviewModel;
  ReviewsTabView({required this.reviewModel});
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ReviewItem(review: reviewModel.results![0]!),
        ],
      ),
    );
  }
}
