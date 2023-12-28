import 'dart:async';
import 'dart:convert';
import 'package:farm/components/Mytext.dart';
import 'package:farm/config/theme/AppColor.dart';
import 'package:farm/model/VideoRewind.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoRewindPage extends StatefulWidget {
  const VideoRewindPage({super.key, required this.animalLodgingName});
  final String animalLodgingName;
  @override
  State<VideoRewindPage> createState() => _VideoRewindPageState();
}

class _VideoRewindPageState extends State<VideoRewindPage> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  late VideoRewind videoRewind;
  Future fetchVideoRewind() async {
    print('go there');
    final response = await http.get(
        Uri.parse('https://fake-api-smart-farm-zwq6.vercel.app/video_rewind'));

    if (response.statusCode == 200) {
//  print(object)
      var jsonData = jsonDecode(response.body);

      videoRewind = new VideoRewind.fromJson(jsonData);
      print('video Link ${videoRewind.videoRewindLink}');
      print('lengt of list Link ${videoRewind.videoRewindProperties?.length}');
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Future<void> SetUp() async {
    // fetchVideoRewind();
    _controller = VideoPlayerController.network(
      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
    );
    // Use the controller to loop the video.
    // _controller.play();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchVideoRewind();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColor.primary[50],
            title: Text(
              widget.animalLodgingName,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.chevron_left_outlined,
                  size: 30,
                  color: AppColor.primary[50],
                ),
              ),
            )),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            FutureBuilder(
              future: SetUp(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Chewie(controller: _chewieController));
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20),
                  // border: Border.all(color: Colors.black),
                  boxShadow: kElevationToShadow[3]),
              height: 400,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: FutureBuilder(
                future: fetchVideoRewind(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      itemCount: videoRewind.videoRewindProperties!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          // shadowColor: Colors.amber,
                          color: videoRewind.videoRewindProperties![index]
                                      .videoRewindType ==
                                  1
                              ? Colors.red.shade300
                              : Colors.white,
                          child: ListTile(
                            title: Row(
                              children: [
                                Text(
                                  'Thời gian: ${videoRewind.videoRewindProperties![index].videoRewindTime} | ${videoRewind.videoRewindProperties![index].videoRewindDate.toString().split(' ')[0]}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            subtitle: Text(
                                '${videoRewind.videoRewindProperties![index].videoRewindTitle}',
                                style: TextStyle(
                                  color: Colors.black,
                                )),
                            onTap: () => _chewieController.seekTo(Duration(
                                hours: videoRewind.videoRewindProperties![index]
                                        .videoRewindH ??
                                    0,
                                minutes: videoRewind
                                        .videoRewindProperties![index]
                                        .videoRewindM ??
                                    0,
                                seconds: videoRewind
                                        .videoRewindProperties![index]
                                        .videoRewindS ??
                                    0)),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ));
  }
}


// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       theme: ThemeData.dark(),
//       home: const VideoScreen(),
//     );
//   }
// }

// class VideoScreen extends StatefulWidget {
//   const VideoScreen({Key? key}) : super(key: key);

//   @override
//   State<VideoScreen> createState() => _VideoScreenState();
// }

// class _VideoScreenState extends State<VideoScreen> {
//   late VideoPlayerController videoPlayerController;
//   late ChewieController chewieController;

//   @override
//   void initState() {
//     super.initState();

//     videoPlayerController = VideoPlayerController.network(
//       'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
//     );

//     chewieController = ChewieController(
//       videoPlayerController: videoPlayerController,
//       aspectRatio: 3 / 2,
//       autoPlay: true,
//       looping: true,
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     videoPlayerController.dispose();
//     chewieController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Demo'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: AspectRatio(
//             aspectRatio: videoPlayerController.value.aspectRatio,
//             child: Chewie(controller: chewieController)),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           chewieController.seekTo(Duration(minutes: 2, seconds: 20));
//         },
//         child: const Icon(Icons.fullscreen),
//       ),
//     );
//   }
// }
