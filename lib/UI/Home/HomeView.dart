import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:e_commerce_application/Core/PrefsHelper.dart';
import 'package:e_commerce_application/Core/Utils/Assets.dart';
import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:e_commerce_application/Core/Utils/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeView extends StatefulWidget {
  HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _pageController = PageController(initialPage: 0);
  final _controller = NotchBottomBarController(index: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> bottomBarPages = [
    Page1(),
    Page2(),
    Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              iconSize: 55,
              icon: SvgPicture.asset(Assets.categoryIcon),
              onPressed: () {},
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: IconButton(
                  icon: SvgPicture.asset(Assets.cartIcon),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: IconButton(
                  icon: SvgPicture.asset(Assets.searchIcon),
                  onPressed: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(6),
                child: IconButton(
                  icon: Icon(Icons.logout_outlined),
                  onPressed: () {
                    PrefsHelper.clearToken();
                    Navigator.pushNamedAndRemoveUntil(
                        context, Routes.loginRouteName, (route) => false);
                  },
                ),
              )
            ],
          ),
          body: PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
                bottomBarPages.length, (index) => bottomBarPages[index]),
          ),
          extendBody: true,
          bottomNavigationBar: (bottomBarPages.length <= 3)
              ? AnimatedNotchBottomBar(
                  kBottomRadius: 20,
                  kIconSize: 30,
                  notchBottomBarController: _controller,
                  color: MyColors.darkSlateGray,
                  showLabel: false,
                  notchColor: MyColors.darkSlateGray,
                  //removeMargins: false,
                  bottomBarWidth: 500.w,
                  durationInMilliSeconds: 100,
                  bottomBarItems: [
                    BottomBarItem(
                      inActiveItem: SvgPicture.asset(
                        Assets.homaIcon,
                        color: Colors.grey,
                      ),
                      activeItem: SvgPicture.asset(
                        Assets.homaIcon,
                        color: Colors.white,
                      ),
                      itemLabel: 'Page 3',
                    ),
                    BottomBarItem(
                      inActiveItem: SvgPicture.asset(
                        Assets.favoriteIcon,
                        color: Colors.grey,
                      ),
                      activeItem: SvgPicture.asset(
                        Assets.favoriteIcon,
                        color: Colors.white,
                      ),
                      itemLabel: 'Page 3',
                    ),

                    ///svg example
                    BottomBarItem(
                      inActiveItem: SvgPicture.asset(
                        Assets.profileIcon,
                        color: Colors.grey,
                      ),
                      activeItem: SvgPicture.asset(
                        Assets.profileIcon,
                        color: Colors.white,
                      ),
                      itemLabel: 'Page 3',
                    ),
                  ],
                  onTap: (index) {
                    _pageController.jumpToPage(index);
                  },
                )
              : null,
        ));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
    );
  }
}

class Page3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
