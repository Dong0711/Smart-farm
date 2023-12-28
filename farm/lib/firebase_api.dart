import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
//tao phien ban thong bao cua firebase

//khoi tao thong bao
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fMCToken = await _firebaseMessaging.getToken();
    print('Token: $fMCToken');
    initPushNotifications();
  }

//xu ly thong bao
  void HandelMessage(RemoteMessage? message) {
    if (message == null) return;
    print('this is $message');
  }

// khoi tao ui
  Future initPushNotifications() async {
    FirebaseMessaging.instance.getInitialMessage().then(HandelMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(HandelMessage);
  }
}
