import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c13/ui/assets.dart';

List<BottomNavigationBarItem> generateBottomNavItems(List<String> icons) {
  List<BottomNavigationBarItem> items = [];
  for (int i = 0; i < icons.length; i++) {
    items.add(BottomNavigationBarItem(
      backgroundColor: AppColors.primaryGold,
      icon: SvgPicture.asset(
        icons[i],
      ),
      label: '',
    ));
  }
  return items;
}
