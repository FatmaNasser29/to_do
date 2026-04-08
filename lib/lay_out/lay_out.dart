import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/login/login_screen.dart';
import 'package:to_do/pallet_colors.dart';
import 'package:to_do/provider/app_auth_provider.dart';
import 'package:to_do/settings/settings_screen.dart';
import 'package:to_do/tasks_screen/tasks_screen.dart';

class LayOut extends StatefulWidget {
  static const String routeName = "layOut";

  const LayOut({super.key});

  @override
  State<LayOut> createState() => _LayOutState();
}

class _LayOutState extends State<LayOut> {
  List<Widget> screens = [TasksScreen(), SettingsScreen()];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var appAuthProvider = Provider.of<AppAuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PalletColors.mainColor,
        title: Text(
          "To Do List",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          InkWell(
            onTap: () {
              appAuthProvider.logOut();
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
            child: Icon(Icons.logout),
          ),
        ],
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: PalletColors.mainColor,
          unselectedItemColor: Colors.blueGrey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list, size: 30),
              label: "tasks",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 30),
              label: "settings",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: PalletColors.mainColor,
        shape: StadiumBorder(side: BorderSide(width: 4, color: Colors.white)),
        onPressed: () {},
        child: Icon(Icons.add, size: 35, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
