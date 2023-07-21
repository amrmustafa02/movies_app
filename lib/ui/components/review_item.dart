import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/movies_details/ReviewModel.dart';
import 'package:movies/ui/components/network_image.dart';

// ignore: must_be_immutable
class ReviewItem extends StatelessWidget {
  ReviewResult review;

  ReviewItem({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: const Color(0xFF2B3543),
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.only(left: 10, right: 10, top: 8),
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                "${review.content}",
                // ignore: prefer_const_constructors
                style: TextStyle(color: Colors.white),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              children: [
                review.authorDetails!.avatarPath == null
                    ? CircleAvatar(
                        child: Image.asset("assets/images/user.png"),
                      )
                    : MyNetworkImage(
                        imageUrl: review.authorDetails!.avatarPath!.substring(1),
                        width: 40,
                        height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
