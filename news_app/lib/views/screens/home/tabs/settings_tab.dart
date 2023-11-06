import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:news_app/controllers/home/settings_controller.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: Get.find<SettingsController>(),
      builder: (controller) => ListView(
        padding: const EdgeInsets.all(18),
        children: [
          SwitchListTile.adaptive(
            value: controller.isSystemTheme,
            onChanged: controller.toggleSystemTheme,
            title: const Text('System Theme'),
          ),
          SwitchListTile.adaptive(
            value: controller.isDarkMode,
            onChanged:
                controller.isSystemTheme ? null : controller.toggleDarkMode,
            title: const Text('Dark Theme'),
            controlAffinity: ListTileControlAffinity.trailing,
            secondary: const Icon(Ionicons.moon_outline),
          ),
          SwitchListTile.adaptive(
            value: controller.isSystemLocale,
            onChanged: controller.toggleSystemLocale,
            title: const Text('System Language'),
          ),
          DropdownButton(
            value: controller.selectedLocale,
            isExpanded: true,
            items: controller.locales
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged:
                controller.isSystemLocale ? null : controller.selectLocale,
          ),
          SwitchListTile.adaptive(
            value: controller.isSystemRegion,
            onChanged: controller.toggleSystemRegion,
            title: const Text('System Region'),
          ),
          DropdownButton(
            value: controller.selectedRegion,
            isExpanded: true,
            items: controller.regions
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
                .toList(),
            onChanged:
                controller.isSystemRegion ? null : controller.selectRegion,
          ),
        ],
      ),
    );
  }
}
