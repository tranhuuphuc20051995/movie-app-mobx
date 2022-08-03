import 'package:flutter/material.dart';
import 'package:movie_app/app/routes/arguments/trailer_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailerPage extends StatelessWidget {
  MovieTrailerPage({Key? key}) : super(key: key);

  late YoutubePlayerController _controller;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as TrailerArguments;
    _controller = YoutubePlayerController(
      initialVideoId: args.trailerLinks[0],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trailer Page'),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.amber,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
            onReady: () {},
          ),
        ],
      ),
    );
  }
}
