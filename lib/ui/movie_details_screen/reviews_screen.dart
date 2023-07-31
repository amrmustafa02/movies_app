import 'package:flutter/material.dart';

import '../../model/api_model/movies_details/ReviewModel.dart';
import '../components/review_item.dart';

class ReviewScreen extends StatelessWidget {
  ReviewModel reviewModel;

  ReviewScreen({required this.reviewModel});

  @override
  Widget build(BuildContext context) {
    String resultString =
        reviewModel.results!.isEmpty ? "" : "${reviewModel.results!.length}";
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_sharp,
            color: Theme.of(context).primaryColor,
          ),
        ),
        title: Text(
          "$resultString Reviews",
          style: const TextStyle(fontSize: 26),
        ),
      ),
      body: reviewModel.results!.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/no-review.png",
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.5),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "No Reviews Found",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  )
                ],
              ),
            )
          : ListView.separated(
              itemBuilder: (context, index) {
                return ReviewItem(review: reviewModel.results![index]);
              },
              separatorBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                );
              },
              itemCount: reviewModel.results!.length),
    );
  }
}
