import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/themes/colors.dart';
import '../../providers/navigation_provider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: navigationProvider.currentIndex,
        onTap: (index) {
          navigationProvider.setIndex(index);

          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/orders');
              break;
            case 2:
              Navigator.pushNamed(context, '/search');
              break;
            case 3:
              Navigator.pushNamed(context, '/delivery');
              break;
            case 4:
              Navigator.pushNamed(context, '/bulk');
              break;
          }
        },

      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.black,
      showSelectedLabels: true,
      showUnselectedLabels: true,


      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fire_truck_rounded),
          label: 'Delivery',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory_2_outlined),
          label: 'bulk',
        ),
      ],
    );
  }
}
