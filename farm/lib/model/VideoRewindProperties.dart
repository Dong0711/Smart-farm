import 'package:intl/intl.dart';

class VideoRewindProperties {
  int? videoRewindID;
  String? videoRewindTitle;
  int? videoRewindType;
  int? videoRewindH;
  int? videoRewindM;
  int? videoRewindS;
  String? videoRewindTime;
  DateTime? videoRewindDate;

  VideoRewindProperties(
      {this.videoRewindID,
      this.videoRewindTitle,
      this.videoRewindType,
      this.videoRewindH,
      this.videoRewindM,
      this.videoRewindS,
      this.videoRewindTime,
      this.videoRewindDate});

  VideoRewindProperties.fromJson(Map<String, dynamic> json) {
    videoRewindID = json['video_rewind_ID'];
    videoRewindTitle = json['video_rewind_title'];
    videoRewindType = json['video_rewind_type'];
    videoRewindH = json['video_rewind_h'];
    videoRewindM = json['video_rewind_m'];
    videoRewindS = json['video_rewind_s'];
    videoRewindTime = json['video_rewind_time'];
    videoRewindDate = DateFormat('dd/mm/yyyy').parse(json['video_rewind_date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['video_rewind_ID'] = this.videoRewindID;
    data['video_rewind_title'] = this.videoRewindTitle;
    data['video_rewind_type'] = this.videoRewindType;
    data['video_rewind_h'] = this.videoRewindH;
    data['video_rewind_m'] = this.videoRewindM;
    data['video_rewind_s'] = this.videoRewindS;
    data['video_rewind_time'] = this.videoRewindTime;
    data['video_rewind_date'] = this.videoRewindDate;
    return data;
  }
}
