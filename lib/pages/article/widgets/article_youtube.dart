import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ArticleYoutube extends StatefulWidget {
  final String? id;
  const ArticleYoutube({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<ArticleYoutube> createState() => _ArticleYoutubeState();
}

class _ArticleYoutubeState extends State<ArticleYoutube> {
  late YoutubePlayerController _controller;

  @override
  @override
  void initState() {


    super.initState();
    // const url='https://www.youtube.com/watch?v=WCm2elbTEZQ';
        const url = 'https://www.youtube.com/watch?v=';
  
    _controller = YoutubePlayerController(

     initialVideoId: widget.id!,
    //   // initialVideoId: YoutubePlayer.convertUrlToId(url)!,
  // initialVideoId: YoutubePlayer.convertUrlToId('$url$videoId')!,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        useHybridComposition: false, // chuyển sang Virtual Display

        enableCaption: true,
      ),
    );

_controller.addListener(() {

});

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              ElevatedButton(
                onPressed: 
                _controller.value.isPlaying
                    ? _controller.pause
                    : _controller.play,
                    child:  Text(
                      _controller.value.isPlaying ? 'Pause' : 'Play',
                    ),
              ),

            ],
          );
        },
      );



  }


