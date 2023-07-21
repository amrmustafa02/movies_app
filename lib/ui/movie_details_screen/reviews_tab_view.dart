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
          SizedBox(
            height: 500,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return ReviewItem(review: reviewModel.results![index]);
                },
                separatorBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                       borderRadius: BorderRadius.circular(50),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                  );
                },
                itemCount: reviewModel.results!.length),
          )
        ],
      ),
    );
  }
}
