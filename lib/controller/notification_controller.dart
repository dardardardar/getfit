import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationController {
  NotificationController();

  final _localNotificationService = FlutterLocalNotificationsPlugin();

  final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

  Future<void> init() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('app_icon');


    const InitializationSettings settings = InitializationSettings(
      android: androidInitializationSettings,

    );


    await _localNotificationService.initialize(
      settings,
      onSelectNotification: onSelectNotification,
    );
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('channel_id', 'channel_name',
        channelDescription: 'description',
        icon:"@mipmap/ic_launcher",
        importance: Importance.max,
        priority: Priority.max,
       );



    return const NotificationDetails(
      android: androidNotificationDetails,
    );
  }

  Future<void> sendNotification({
    required int id,
    required String title,
    required String body,
    String? payload,
  }) async {
    final details = await _notificationDetails();
    await _localNotificationService.show(id, title, body, details,payload: payload);
  }

  Future<void> sendScheduledNotification(
      {required int id,
        required String title,
        required String body,
        required int seconds}) async {
    final details = await _notificationDetails();
    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        DateTime.now().add(Duration(seconds: seconds)),
        tz.local,
      ),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
    );
  }


  void onSelectNotification(String? payload) {
    print('payload $payload');
    if (payload != null && payload.isNotEmpty) {
      onNotificationClick.add(payload);
    }
  }
}