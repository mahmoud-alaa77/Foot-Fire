import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foot_fire/core/dependancy_injection/di.dart';
import 'package:foot_fire/core/theming/app_colors.dart';
import 'package:foot_fire/features/favorites/logic/cubit/favorites_cubit.dart';
import 'package:foot_fire/features/favorites/ui/favorite_items_screen_body.dart';
import 'package:foot_fire/features/home/ui/home_screen_body.dart';
import 'package:foot_fire/features/news/logic/cubit/news_cubit.dart';
import 'package:foot_fire/features/news/ui/news_screen_body.dart';
import 'package:foot_fire/features/search/logic/cubit/search_cubit.dart';
import 'package:foot_fire/features/search/ui/search_screen_body.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _bodies = [
    const HomeScreenBody(),
    BlocProvider(
      create: (context) => getIt<NewsCubit>()..getNews("football"),
      child: const NewsScreenBody(),
    ),
    BlocProvider(
      create: (context) => getIt<FavoritesCubit>()..getAllFavoriteItems(),
      child: const FavoriteItemsScreen(),
    ),
    BlocProvider(
      create: (context) => getIt<SearchCubit>(),
      child: const SearchScreenBody(),
    ),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      if (_currentIndex == 0) {
        context.read<FavoritesCubit>().getFavoritePlayers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backGroundBlackColor,
        body: _bodies[_currentIndex],
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BottomNavigationBar(
          selectedItemColor: AppColors.orangeColor,
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          elevation: 0,
          selectedFontSize: 14.sp,
          unselectedFontSize: 12.sp,
          iconSize: 25.r,
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: AppColors.lightGrayColor,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
        ),
      ),
    );
  }
}
