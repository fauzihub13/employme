<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
import 'package:employme/core/components/main_app_bar.dart';
import 'package:employme/core/components/search_input.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/presentation/home/widgets/title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
>>>>>>> 7ce04ade7932b3fbcc9de63b6159fe097679d680

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Center(child: Text('HOME PAGE')),
=======
      body: Column(
        children: [
          MainAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  spacing: 10,
                  children: [
                    Expanded(
                      child: SearchInput(
                        controller: TextEditingController(),
                        hintText: 'Search a job or position',
                      ),
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          'assets/icons/filter.svg',
                          colorFilter: const ColorFilter.mode(
                              AppColors.darkGrey, BlendMode.srcIn),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 34,
                ),
                TitleSection(
                    title: 'Featured Jobs',
                    onPressed: () {
                      // print('KLIKKK');
                    }),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 156,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.primaryBlue,
                      image: DecorationImage(
                          image: const AssetImage(
                              'assets/images/overlay_banner.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.white.withValues(alpha: 0.2),
                              BlendMode.modulate))),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      spacing: 16,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 10,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                'assets/images/avatar.jpg',
                                width: 50,
                                height: 50,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Junior Mobile ',
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Telkom Indonesia ',
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )),
                            SvgPicture.asset(
                              'assets/icons/bookmark.svg',
                              width: 26,
                              height: 26,
                            )
                          ],
                        ),
                        Row(
                          spacing: 12,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 16),
                                child: Text(
                                  'Junior',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 16),
                                child: Text(
                                  'Senior',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 16),
                                child: Text(
                                  'Internship',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('90k/year',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                            Text('Texas, USA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
>>>>>>> 7ce04ade7932b3fbcc9de63b6159fe097679d680
    );
  }
}
