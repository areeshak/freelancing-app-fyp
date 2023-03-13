import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(String? heading, List<Widget>? actions) =>
    AppBar(
      shadowColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      title: Text(heading ?? ""),
      actions: actions,
    );
