import 'package:farm/model/VideoRewindProperties.dart';

class VideoRewind {
  String? videoRewindLink;
  List<VideoRewindProperties>? videoRewindProperties;

  VideoRewind({this.videoRewindLink, this.videoRewindProperties});

  VideoRewind.fromJson(Map<String, dynamic> json) {
    videoRewindLink = json['video_rewind_link'];
    if (json['video_rewind_properties'] != null) {
      videoRewindProperties = <VideoRewindProperties>[];
      json['video_rewind_properties'].forEach((v) {
        videoRewindProperties!.add(new VideoRewindProperties.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_rewind_link'] = this.videoRewindLink;
    if (this.videoRewindProperties != null) {
      data['video_rewind_properties'] =
          this.videoRewindProperties!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
