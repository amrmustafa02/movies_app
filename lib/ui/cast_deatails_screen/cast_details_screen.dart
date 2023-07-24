import 'package:flutter/material.dart';
import 'package:movies/constants/api_data.dart';
import 'package:movies/model/api_model/cast_details/CastDetailsModel.dart';
import 'package:movies/ui/components/network_image.dart';
import 'package:movies/ui/components/type_movies_row.dart';
import 'package:readmore/readmore.dart';

import '../shared/text_utils.dart';

class CastDetailsScreen extends StatelessWidget {
  CastDetailsModel castDetailsModel;

  CastDetailsScreen({required this.castDetailsModel});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    MyNetworkImage(
                        imageUrl: ApiData.largeImageSizeUri +
                            castDetailsModel.profilePath!,
                        width: size.width,
                        height: size.height * 0.5),
                    Container(
                      width: size.width,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          gradient: LinearGradient(
                            colors: [
                              // Colors.black.withOpacity(0.8),
                              Theme.of(context).scaffoldBackgroundColor.withOpacity(1.0),
                              // Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                              Colors.black.withOpacity(0.1),
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          )),
                    ),
                  ],
                ),
                Text(
                  castDetailsModel.name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: "LobsterRegular"),
                )
              ],
            ),
            Row(
              children: [
                (castDetailsModel.birthday != " " &&
                        castDetailsModel.birthday != null)
                    ? Expanded(
                        child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Colors.blueGrey, width: 0.5)),
                        child: Column(
                          children: [
                            const ImageIcon(
                                size: 30,
                                color: Colors.blueGrey,
                                AssetImage("assets/images/date_of_birth.png")),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              TextUtils.getReleaseDate(
                                  castDetailsModel.birthday ?? ""),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ))
                    : Container(),
                castDetailsModel.placeOfBirth != "" &&
                        castDetailsModel.placeOfBirth != null
                    ? Expanded(
                        child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border:
                                Border.all(color: Colors.blueGrey, width: 0.5)),
                        child: Column(
                          children: [
                            const ImageIcon(
                                size: 30,
                                color: Colors.blueGrey,
                                AssetImage("assets/images/location.png")),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              castDetailsModel.placeOfBirth ?? "",
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ))
                    : Container(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Biography",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 5),
                  ReadMoreText(
                    castDetailsModel.biography!,
                    postDataTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    preDataTextStyle:
                        const TextStyle(fontSize: 16, color: Colors.grey),
                    trimLines: 5,
                    colorClickableText: Colors.red,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'More',
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(
                        fontSize: 16, color: Theme.of(context).primaryColor),
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Images",style: TextStyle(
                      fontSize: 24,
                      color: Colors.white
                  ),),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width + 70,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MyNetworkImage(
                            imageUrl:ApiData.midImageSizeUrl+ castDetailsModel.images!.profiles![index].filePath!,
                            width: MediaQuery.of(context).size.width - 50,
                            height: MediaQuery.of(context).size.width + 70,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container(width: 20,);
                        },
                        itemCount: castDetailsModel.images!.profiles!.length),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
