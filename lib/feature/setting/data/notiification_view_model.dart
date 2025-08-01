import 'package:shared_preferences/shared_preferences.dart';

class NotificationViewModel {
  Future<void> saveTitle(String title) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> currentList = prefs.getStringList('savedTitles') ?? [];
    if (!currentList.contains(title)) {
      currentList.add(title);
      await prefs.setStringList('savedTitles', currentList);
    }
  }

  Future<List<String>> getSavedTitles() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('savedTitles') ?? [];
  }

   Future<void> removeTitleAt(int index) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> currentList = prefs.getStringList('savedTitles') ?? [];
    if (index >= 0 && index < currentList.length) {
      currentList.removeAt(index);
      await prefs.setStringList('savedTitles', currentList);
    }
  }

  Future<void> clearAllTitles() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove('savedTitles');
}

Future<void> saveNotificationsEnabled(bool isEnabled) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('notifications_enabled', isEnabled);
}

Future<bool> isNotificationsEnabled() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('notifications_enabled') ?? true; 
}

}
