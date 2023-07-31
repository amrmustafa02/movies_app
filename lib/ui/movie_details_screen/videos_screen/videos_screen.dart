import 'package:flutter/material.dart';
import 'package:movies/model/api_model/video_data_model.dart';
import 'package:movies/ui/movie_details_screen/show_more_movie_details_item.dart';
import 'package:movies/ui/shared/text_utils.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

typedef onClickFunction = void Function();

class VideosScreen extends StatefulWidget {
  List<VideoDataModel> videos;
  static String youtubeBaseUrl = "https://www.youtube.com/watch?v=";

  VideosScreen({required this.videos});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  int index = 0;
  late YoutubePlayerController controller;
  late var video;

  @override
  void initState() {
    video = widget.videos[index];
    String videoId;
    videoId = YoutubePlayer.convertUrlToId(
        "https://www.youtube.com/watch?v=${video.key}")!;
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        showLiveFullscreenButton: false,
        autoPlay: false,
        mute: false,
        loop: false,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        title: Text("${index + 1} of ${widget.videos.length} videos"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    bottomActions: [
                      CurrentPosition(),
                      ProgressBar(
                        isExpanded: true,
                        colors: ProgressBarColors(
                          playedColor: Theme.of(context).primaryColor,
                          handleColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      RemainingDuration(),
                    ],
                    width: MediaQuery.of(context).size.width,
                    controller: controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    progressColors: ProgressBarColors(
                      playedColor: Theme.of(context).primaryColor,
                      handleColor: Theme.of(context).primaryColor,
                    ),
                    onReady: () {
                      // _controller.addListener(listener);
                    },
                  ),
                  builder: (context, player) {
                    return Column(
                      children: [
                        // some widgets
                        player,
                        //some other widgets
                      ],
                    );
                  }),
              Container(
                margin: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      video.name!,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const ImageIcon(
                          AssetImage("assets/images/world_wide_web.png"),
                          color: Colors.blueGrey,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${video.site}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const ImageIcon(
                          AssetImage("assets/images/calendar(2).png"),
                          color: Colors.blueGrey,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${TextUtils.getReleaseDate(video.publishedAt)}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const ImageIcon(
                          AssetImage("assets/images/types.png"),
                          color: Colors.blueGrey,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${video.type}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    getButtons(),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  getButtons() {
    if (index == 0) {
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: getButtonNextButton(),
        ),
      );
    } else if (index > 0 && index < widget.videos.length - 1) {
      return Row(
        children: [
          Expanded(child: getButtonBackButton()),
          Expanded(child: getButtonNextButton()),
        ],
      );
    } else if (index == widget.videos.length - 1) {
      return Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: getButtonBackButton(),
        ),
      );
    }
  }

  getButtonNextButton() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor),
        onPressed: () {
          index++;
          video = widget.videos[index];
          String videoId;
          videoId = YoutubePlayer.convertUrlToId(
              "https://www.youtube.com/watch?v=${video.key}")!;
          controller.load(videoId);

          setState(() {});
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Next",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.arrow_forward,
              size: 15,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  getButtonBackButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor),
      onPressed: () {
        index--;
        video = widget.videos[index];
        String videoId;
        videoId = YoutubePlayer.convertUrlToId(
            "https://www.youtube.com/watch?v=${video.key}")!;
        controller.load(videoId);
        setState(() {});
      },
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back,
            size: 15,
            color: Colors.white,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Back",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
