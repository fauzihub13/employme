import 'package:employme/core/components/dot_indicator.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/presentation/bookmark/pages/bookmark_page.dart';
import 'package:employme/presentation/home/pages/home_page.dart';
import 'package:employme/presentation/message/pages/message_page.dart';
import 'package:employme/presentation/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  final _menuIcons = {
    'home': 'assets/icons/navbar/home.svg',
    'message': 'assets/icons/navbar/message.svg',
    'bookmark': 'assets/icons/navbar/bookmark.svg',
    'category': 'assets/icons/navbar/category.svg',
  };

  final List<String> _menuKeys = ['home', 'message', 'bookmark', 'category'];

  List<BottomNavigationBarItem> get _menuItems => _menuKeys.map((key) {
        return BottomNavigationBarItem(
          icon: Column(
            spacing: 4,
            children: [
              SvgPicture.asset(
                _menuIcons[key]!,
                colorFilter:
                    const ColorFilter.mode(AppColors.disabled, BlendMode.srcIn),
              ),
              const DotIndicator(
                color: Colors.transparent,
              ),
            ],
          ),
          activeIcon: Column(
            spacing: 4,
            children: [
              SvgPicture.asset(
                _menuIcons[key]!,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryBlue, BlendMode.srcIn),
              ),
              const DotIndicator(),
            ],
          ),
          label: '',
        );
      }).toList();

  final List<Widget> _pages = [
    const HomePage(),
    const MessagePage(),
    const BookMarkPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        enableFeedback: false,
        elevation: 1,
        items: _menuItems,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
