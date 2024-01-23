import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kw_store_app/core/color/app_color.dart';
import 'package:kw_store_app/core/paths/app_image_paths.dart';
import 'package:kw_store_app/core/routes/app_routes.dart';
import 'package:kw_store_app/view/about/about_screen.dart';
import 'package:kw_store_app/view/companies/companies_screen.dart';
import 'package:kw_store_app/view/favorite/favorite_screen.dart';
import 'package:kw_store_app/view/home/home_screen.dart';
import 'package:kw_store_app/view/layout/bloc/layout_bloc.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const CompaniesScreen(),
    const AboutScreen(),
  ];

  int _currentIndex = 0;

  LayoutControllerBloc get _bloc =>
      BlocProvider.of<LayoutControllerBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutControllerBloc, LayoutState>(
      listener: (context, state) {
        if (state is NavigateBottomNavigationState) {
          _currentIndex = state.currentIndex;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: SvgPicture.asset(
              AppImagePaths.kwLogoSmall,
            ),
            actions: [
              IconButton(
                onPressed: () => Navigator.of(context).pushNamed(
                  AppRoutes.cart,
                ),
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: AppColorScheme.black,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
            ],
          ),
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppColorScheme.white,
            onTap: (currentIndex) => _bloc
                .add(NavigateBottomNavigationEvent(currentIndex: currentIndex)),
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            elevation: 0.0,
            selectedItemColor: AppColorScheme.black,
            unselectedItemColor: AppColorScheme.greyNavigation,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
            items: [
              const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: 'الرئيسية'),
              const BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.heart), label: 'المفضلة'),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.apps), label: 'الشركات'),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImagePaths.kwLogoSmall,
                ),
                label: 'عن التطبيق',
              ),
            ],
            currentIndex: _currentIndex,
          ),
        );
      },
    );
  }
}
