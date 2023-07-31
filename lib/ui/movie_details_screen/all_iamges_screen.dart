import 'package:flutter/material.dart';
import 'package:movies/model/api_model/movies_details/ImagesOfMovies.dart';

import '../../constants/api_data.dart';
import '../components/network_image.dart';

class AllImagesScreen extends StatelessWidget {
  ImagesOfMovies imagesOfMovies;

  AllImagesScreen({required this.imagesOfMovies});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height * 0.25;
    var width = height + 50;

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
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: const Text(
                "Logos",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(8),
                height: height,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesOfMovies.logos!.length,
                  itemBuilder: (context, index) {
                    return MyNetworkImage(
                      imageUrl: ApiData.largeImageSizeUri +
                          imagesOfMovies.logos![index].filePath!,
                      width: width,
                      height: height,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: const Text(
                "BackDrops",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(8),
                height: height,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesOfMovies.backdrops!.length,
                  itemBuilder: (context, index) {
                    return MyNetworkImage(
                      imageUrl: ApiData.largeImageSizeUri +
                          imagesOfMovies.backdrops![index].filePath!,
                      width: width,
                      height: height,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: const Text(
                "Posters",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(8),
                height: height,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: imagesOfMovies.posters!.length,
                  itemBuilder: (context, index) {
                    return MyNetworkImage(
                      imageUrl: ApiData.largeImageSizeUri +
                          imagesOfMovies.posters![index].filePath!,
                      width: width - 50,
                      height: height + 50,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 20,
                    );
                  },
                )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
