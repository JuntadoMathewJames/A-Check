import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return LayoutBuilder(
      builder: (context, constraints) {
        return NavigationRail(
          extended: constraints.maxWidth >= 600,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.favorite),
              label: Text('Favorites'),
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            selectedIndex = value;
          },
        );
      },
    );
  }
}
