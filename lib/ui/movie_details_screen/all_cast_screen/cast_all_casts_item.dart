import 'package:flutter/material.dart';

import '../../../constants/api_data.dart';
import '../../../model/api_model/movies_details/Cast.dart';
import '../../components/network_image.dart';

// ignore: must_be_immutable
class CastViewAllItem extends StatelessWidget {
  String imagePath;
  String name;
  String secondTitle;

  CastViewAllItem(
      {required this.name,
      required this.secondTitle,
      required this.imagePath,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipOval(
            child: imagePath.isEmpty
                ? Image.asset(
                    "assets/images/user.png",
                    width: 70,
                    height: 70,
                    fit: BoxFit.fill,
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: MyNetworkImage(
                      imageUrl: ApiData.midImageSizeUrl + (imagePath),
                      width: 75,
                      height: 75,
                    )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name.isNotEmpty ? name : "No name found!!",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                child: Text(
                  secondTitle.isNotEmpty ? secondTitle : "No name found!!",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
