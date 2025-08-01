import 'package:flutter/material.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/notification_item.dart';

class NotificationsItemList extends StatelessWidget {
  final List<String> titles;
  final Function(int) onDismiss;
  const NotificationsItemList({super.key, required this.titles, required this.onDismiss});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(titles[index]),
          background: Container(
            color: Colors.black,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) => onDismiss(index),
          direction: DismissDirection.endToStart,
          child: NotificationItem(
            title: titles[index],
            ),
        );
      },
      itemCount: titles.length,
    );
  }
}