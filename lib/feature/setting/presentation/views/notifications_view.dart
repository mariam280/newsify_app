import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsify/core/helper/constants.dart';
import 'package:newsify/feature/setting/data/notiification_view_model.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/notifications_item_list.dart';
import 'package:newsify/feature/setting/presentation/views/widgets/setting_views_header.dart';

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  final viewModel = NotificationViewModel();
  List<String> titles = [];

  @override
  void initState() {
    super.initState();
    loadTitles();
  }

  void loadTitles() async {
    final saved = await viewModel.getSavedTitles();
    setState(() {
      titles = saved;
    });
  }

  Future<void> removeTitle(int index) async {
    await viewModel.removeTitleAt(index);
    setState(() {
      titles.removeAt(index);
    });
  }

  Future<void> clearAll() async {
    await viewModel.clearAllTitles();
    setState(() {
      titles.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryolor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SettingViewsHeader(
                    title: 'Notifications',
                    onTap: () {
                      GoRouter.of(context).go('/pageView');
                    },
                  ),
                  IconButton(
                    onPressed: clearAll,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: titles.isEmpty
                  ? const Center(child: Text('No notifications yet'))
                  : NotificationsItemList(
                      titles: titles,
                      onDismiss: removeTitle,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
