import 'package:flutter/material.dart';
import '../models/notification_info.dart';

class NotificationWidget extends StatelessWidget {
  final NotificationList item;
  const NotificationWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(
            item.text,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: Text(item.date, style: const TextStyle(fontSize: 18))),
    );
  }
}
