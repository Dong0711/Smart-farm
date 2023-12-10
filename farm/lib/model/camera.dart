class Camera {
  int? cameraID;
  String? cameraNanme;
  String? cameraLink;

  Camera({this.cameraID, this.cameraNanme, this.cameraLink});

  Camera.fromJson(Map<String, dynamic> json) {
    cameraID = json['Camera_ID'];
    cameraNanme = json['camera_nanme'];
    cameraLink = json['camera_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Camera_ID'] = cameraID;
    data['camera_nanme'] = cameraNanme;
    data['camera_link'] = cameraLink;
    return data;
  }
}