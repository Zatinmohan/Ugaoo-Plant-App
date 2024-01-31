import 'package:flutter/material.dart';

class ProfileSettingsModel {
  final String name;
  final VoidCallback onTap;

  const ProfileSettingsModel({required this.name, required this.onTap});
}
