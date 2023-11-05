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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Camera_ID'] = this.cameraID;
    data['camera_nanme'] = this.cameraNanme;
    data['camera_link'] = this.cameraLink;
    return data;
  }
}