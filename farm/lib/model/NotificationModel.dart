class NotificationModel {
  int? notificationID;
  int? notificationType;
  String? notificationTime;
  String? notificationDate;
  String? notificationTitle;
  String? notificationSub;
  String? notificationImage;
  bool? notificationRead;
  NotificationModel({
    this.notificationID,
    this.notificationType,
    this.notificationTime,
    this.notificationDate,
    this.notificationTitle,
    this.notificationSub,
    this.notificationImage,
    this.notificationRead,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationID = json['notification_ID'];
    notificationType = json['notification_type'];
    notificationTime = json['notification_time'];
    notificationDate = json['notification_date'];
    notificationTitle = json['notification_title'];
    notificationSub = json['notification_sub'];
    notificationImage = json['notification_image'];
    notificationRead = (json['notification_read'] == 1) ? true : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_ID'] = this.notificationID;
    data['notification_type'] = this.notificationType;
    data['notification_time'] = this.notificationTime;
    data['notification_date'] = this.notificationDate;
    data['notification_title'] = this.notificationTitle;
    data['notification_sub'] = this.notificationSub;
    data['notification_image'] = this.notificationImage;
    data['notification_read'] = (notificationRead == true) ? 1 : 0;
    return data;
  }
}
