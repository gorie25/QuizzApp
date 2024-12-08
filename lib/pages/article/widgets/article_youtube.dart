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

  // Biến dùng để chuyển đổi giữa các trạng thái của video
  late TextEditingController idController;
  late TextEditingController _seekToController;
  //Lưu trạng thái tắt, bật phát video
  late PlayerState _playerState;

  //Lưu thông tin video
  late YoutubeMetaData _videoMetaData;

  double _volume = 100;

  //Xác định trạng thái tắt, bật âm thanh
  bool _muted = false;

  //Xác định trạng thái video đã sẵn sàng chưa
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    const url = 'https://www.youtube.com/watch?v=';

    _controller = YoutubePlayerController(
      initialVideoId: widget.id!,
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

    idController = TextEditingController();
    _seekToController = TextEditingController();
    _videoMetaData = const YoutubeMetaData();
    _playerState = PlayerState.unknown;

    _controller.addListener(() {
      if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
        setState(() {
          _playerState = _controller.value.playerState;
          _videoMetaData = _controller.metadata;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.dispose();
    idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) => YoutubePlayerBuilder(
        player: YoutubePlayer(
          bottomActions: [
            const SizedBox(width: 14.0),
            CurrentPosition(),
            const SizedBox(width: 8.0),
            ProgressBar(
              isExpanded: true,
            ),
            RemainingDuration(),
            const PlaybackSpeedButton(),
          ],
          controller: _controller,
          onReady: () {
            _isPlayerReady = true;
          },
          progressIndicatorColor: Colors.blueAccent,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
          return player;
        },
      );
}
