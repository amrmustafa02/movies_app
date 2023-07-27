import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/movies_details/ReviewModel.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/shared/text_utils.dart';
import 'package:readmore/readmore.dart';

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
              child: Column(
                children: [
                  review.authorDetails!.rating != null
                      ? RatingBar(
                    allowHalfRating: true,
                    itemCount: 5,
                    ignoreGestures: true,
                    initialRating: review.authorDetails!.rating!.toDouble() / 2,
                    itemSize: 25,
                    ratingWidget: RatingWidget(
                        full: const Icon(
                          Icons.star_rate_rounded,
                          color: Colors.yellow,
                        ),
                        half: const Icon(Icons.star_half_rounded,
                            color: Colors.yellow),
                        empty: const Icon(Icons.star_border_rounded,
                            color: Colors.yellow)),
                    onRatingUpdate: (value) {},
                  )
                      : Container(),
                  const SizedBox(
                    height: 5,
                  ),
                  ReadMoreText(
                    review.content!,
                    trimLines: 5,
                    colorClickableText: Colors.red,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'More',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(
                        fontSize: 16, color: Theme.of(context).primaryColor),
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Row(
              children: [
                review.authorDetails!.avatarPath == null
                    ? CircleAvatar(
                        child: Image.asset("assets/images/user.png"),
                      )
                    : ClipOval(
                      child: MyNetworkImage(
                          imageUrl:
                              (review.authorDetails!.avatarPath![0] == '/' &&
                                      review.authorDetails!.avatarPath![1] == 'h')
                                  ? review.authorDetails!.avatarPath!.substring(1)
                                  : ApiData.reviewBaseUrl +
                                      review.authorDetails!.avatarPath!,
                          width: 40,
                          height: 40),
                    ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      review.authorDetails!.username ?? "test",
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      TextUtils.getReleaseDate(review.updatedAt) ?? "test",
                      style: TextStyle(
                          fontSize: 14, color: Colors.grey.withOpacity(0.5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
