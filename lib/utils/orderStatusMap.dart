import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

const Map<String, IconData> statusIcons = {
  'Ongoing': FontAwesomeIcons.spinner,
  'Delivered': FontAwesomeIcons.circleCheck,
  'Revision': FontAwesomeIcons.rightLeft,
  'Accepted': FontAwesomeIcons.solidCircleCheck,
  'Rejected': FontAwesomeIcons.solidCircleXmark,
};

const Map<String, Color> statusColor = {
  'Ongoing': Colors.orange,
  'Delivered': Colors.green,
  'Revision': Colors.yellow,
  'Accepted': Colors.blue,
  'Rejected': Colors.red,
};

String getStatusMessage({ required  String orderStatus, required DateTime delivery}) {
  switch (orderStatus) {
    case "Ongoing":
    case "Delivered":
    case "Revision":
      return delivery.isBefore(DateTime.now())
          ? 'Delivered on ${DateFormat.yMMMd().format(delivery)}'
          : 'Delivery in ${delivery.difference(DateTime.now()).inDays} day(s)';
    case "Accepted":
    case "Rejected":
      return orderStatus == "Accepted"
          ? 'Accepted on ${DateFormat.yMMMd().format(delivery)}'
          : 'Rejected on ${DateFormat.yMMMd().format(delivery)}';
    default:
      return 'N/A';
  }
}

