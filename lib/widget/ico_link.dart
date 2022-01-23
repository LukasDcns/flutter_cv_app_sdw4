import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

Widget ico_link(var _ico, String _url) {
  return GestureDetector(
    onTap: () {
      launch(_url, forceSafariVC: true);
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: FaIcon(
          _ico,
          color: Colors.white,
          size: 32.0,
        ),
      ),
    ),
  );
}