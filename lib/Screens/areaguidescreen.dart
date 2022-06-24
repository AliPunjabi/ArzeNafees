// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, dead_code

import 'package:arzenafees/Components/Export/custom_import.dart';
import 'package:arzenafees/model/areaview.dart';
import 'package:arzenafees/services/areaguideapi.dart';
import 'package:video_player/video_player.dart';

class areaguide extends StatefulWidget {
  final Property areaData;
  areaguide(this.areaData);

  @override
  State<areaguide> createState() => _areaguideState();
}

class _areaguideState extends State<areaguide> {
  late VideoPlayerController _controller;

  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String areaName = widget.areaData.locationCity;
    final String areaSubtype = widget.areaData.locationArea;
    return Scaffold(
        body: FutureBuilder(
      future: fetchareaguide(areaName, areaSubtype),
      builder: (context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData && !snapshot.hasError) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text("No data Found"),
          );
        } else {
          final Map<String, dynamic> guide = (snapshot.data)['areaGuide'];
          final String sector = guide['sector'];
          final String city = guide['city'];
          final String description = guide['description'];
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the VideoPlayerController has finished initialization, use
                      // the data it provides to limit the aspect ratio of the video.
                      return AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        // Use the VideoPlayer widget to display the video.
                        child: VideoPlayer(_controller),
                      );
                    } else {
                      // If the VideoPlayerController is still initializing, show a
                      // loading spinner.
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            // If the video is playing, pause it.
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              // If the video is paused, play it.
                              _controller.play();
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          _controller.value.isPlaying ? 'Pause' : 'Play',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ))),
              ],
            ),
          );
        }
      },
    ));
  }
}
