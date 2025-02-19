import 'package:employme/core/components/custom_button.dart';
import 'package:employme/core/components/custom_header_clipper.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:employme/presentation/job/pages/job_apply_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobDetailPage extends StatefulWidget {
  const JobDetailPage({super.key});

  @override
  State<JobDetailPage> createState() => _JobDetailPageState();
}

class _JobDetailPageState extends State<JobDetailPage>
    with SingleTickerProviderStateMixin {
  bool isSaved = false;

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                // BACKGROUND
                Positioned.fill(
                  child: ClipPath(
                    clipper: CustomHeaderClipper(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlue,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/overlay_banner_large.png'),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.white.withValues(alpha: 0.05),
                            BlendMode.modulate,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // MAIN CONTENT
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 36,
                            height: 36,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/back.svg',
                                colorFilter: const ColorFilter.mode(
                                    AppColors.white, BlendMode.srcIn),
                                width: 30,
                                height: 30,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSaved = !isSaved;
                              });
                            },
                            child: SvgPicture.asset(
                              'assets/icons/bookmark.svg',
                              width: 24,
                              height: 24,
                              colorFilter: ColorFilter.mode(
                                isSaved ? AppColors.white : AppColors.darkGrey,
                                BlendMode.srcATop,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/avatar.jpg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Product Designer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Google Inc.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.lightGrey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 14,
                        runSpacing: 10,
                        children: List.generate(6, (index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            child: Text(
                              'Junior',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$160,000/year',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'California, USA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    TabBar(
                        controller: tabController,
                        indicatorColor: Colors.transparent,
                        labelColor: AppColors.primaryBlue,
                        unselectedLabelColor: AppColors.darkGrey,
                        dividerColor: AppColors.baseColor,
                        padding: EdgeInsets.all(0),
                        isScrollable: true,
                        tabAlignment: TabAlignment.center,
                        tabs: [
                          Tab(
                            text: 'Description',
                          ),
                          Tab(
                            text: 'Requirement',
                          ),
                          Tab(
                            text: 'About',
                          ),
                          Tab(
                            text: 'Reviews',
                          ),
                        ]),
                    Expanded(
                      child: TabBarView(controller: tabController, children: [
                        Text(
                          '\u2022 Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: AppColors.darkGrey, fontSize: 16),
                        ),
                        Text(
                          'Hi 2',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: AppColors.darkGrey, fontSize: 16),
                        ),
                        Text(
                          'Hi 3',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: AppColors.darkGrey, fontSize: 16),
                        ),
                        Text(
                          'Hi 4',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: AppColors.darkGrey, fontSize: 16),
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: CustomButton.filled(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const JobApplyPage();
                }));
              },
              label: 'Apply Now')),
    );
  }
}
