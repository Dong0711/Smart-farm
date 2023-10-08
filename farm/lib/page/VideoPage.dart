// import 'package:flutter/material.dart';

// import 'package:farm/components/BottomBar.dart';

// class VideoPage extends StatefulWidget {
//   const VideoPage({super.key});

//   @override
//   State<VideoPage> createState() => _VideoPage();
// }

// class _VideoPage extends State<VideoPage> {
//   int selectedIndex = 1;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomBar(
//         onTap: (int index) {
//           setState(() {
//             selectedIndex = index;
//             print(selectedIndex);
//           });
//           Navigator.of(context).pushReplacement(
//               MaterialPageRoute(builder: (context) => VideoPage()));
//         },
//         index: selectedIndex,
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Text('video pge'),
//         ),
//       ),
//     );
//   }
// }
