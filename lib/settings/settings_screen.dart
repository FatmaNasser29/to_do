import 'package:drop_down_list_menu/drop_down_list_menu.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = "setting";

  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> languges = ['English', 'Arabic'];
  String _selectedlanguge = 'English';

  final List<String> themes = ['Light', 'Dark'];
  String _selectedtheme = 'Light';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Drop Down Menu')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                child: DropDownMenu(
                  title: 'Select your languge',
                  enabled: true,
                  values: languges,
                  value: _selectedlanguge,

                  onChanged: (value) {
                    setState(() {
                      _selectedlanguge = value!;
                    });
                  },
                ),
              ),
              SizedBox(height: 25),
              SizedBox(
                child: DropDownMenu(
                  title: 'Select your Theme',
                  enabled: true,
                  values: themes,
                  value: _selectedtheme,

                  onChanged: (value) {
                    setState(() {
                      _selectedtheme = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
