import 'package:flutter/material.dart';
import 'package:movies/model/api_model/movies_details/ReviewModel.dart';

class ReviewItem extends StatelessWidget {
  ReviewResult review;

  ReviewItem({required this.review});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFF2B3543),
              borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
          height: 100,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [

              ],
            ),
          ),
        ),
        Row(
          children: [
            const SizedBox(width: 50),
            Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/under_comment.png")),
              ),
            ),
          ],
        ),
        const Row(
          children: [
            Column(),
          ],
        ),
      ],
    );
  }
}
