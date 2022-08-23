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
  tz.TZDateTime _convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minutes,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
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
  tz.TZDateTime _nextInstanceOfTenAM(int hour,int min) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
    tz.TZDateTime(tz.local, now.year, now.month, now.day, hour,min);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
  Future<void> sendScheduledNotification(
      {required int id,
        required String title,
        required String body,
        required int hour,
        required int min
      }) async {
    tz.initializeTimeZones();
    final details = await _notificationDetails();


    await _localNotificationService.zonedSchedule(
      id,
      title,
      body,
      _nextInstanceOfTenAM(hour,min),
      details,
      androidAllowWhileIdle: true,
      matchDateTimeComponents: DateTimeComponents.time,
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