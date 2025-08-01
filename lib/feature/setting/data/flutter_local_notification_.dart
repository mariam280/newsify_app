import 'package:flutter/material.dart';
import 'package:newsify/core/errors/failures.dart';
import 'package:newsify/feature/setting/data/notiification_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:dio/dio.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> showNotification(String title) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    '0',
    'newsify',
    channelDescription: 'Application for news',
    importance: Importance.max,
    priority: Priority.high,
    playSound: true,
    enableVibration: true,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.show(
    0,
    'Newsify',
    title,
    platformChannelSpecifics,
  );
}

void callbackDispatcher() {
  var initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  var initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
 final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  WidgetsFlutterBinding.ensureInitialized();
  flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (response) {
      if (response.payload != null) {
        print('Notification payload: ${response.payload}');
        // GoRouter.of(context).go('/notificationsView');
      }
    },
  );

  Workmanager().executeTask((task, inputData) async {
      final prefs = await SharedPreferences.getInstance();
    final isEnabled = prefs.getBool('notifications_enabled') ?? true;

    if (isEnabled) {
     await showNewsNotifications();
    } else {
      print('Notifications are disabled');
    }
    return Future.value(true);
  });
}

Future<void> showNewsNotifications() async {
  try {
    final dio = Dio();
  
    final response = await dio.get(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: {
        'country': 'us',
        'apiKey': '80cab9873bdf4cc5a0a2eb559d77ac08',
      },
    );
  
    final data = response.data;
    final List articles = data['articles'];
  
    if (articles.isNotEmpty) {
      final String latestTitle = articles[0]['title'];
  
      final viewModel = NotificationViewModel();
      final savedTitles = await viewModel.getSavedTitles();
  
      if (!savedTitles.contains(latestTitle)) {
        await viewModel.saveTitle(latestTitle);
        await showNotification(latestTitle);
      }
    }
  } catch (e) {
    final errorMessage = e is DioException
        ? ServerFailer.fromDioException(e).errorMessage
        : e.toString();
    print("there was an erorr: $errorMessage");
  }
}