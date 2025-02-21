import '../../../data/datasource/auth_local_datasource.dart';
import '/core/components/card_job.dart';
import '/core/components/title_section.dart';
import '/presentation/auth/login_page.dart';
import '/presentation/job/pages/job_applied_history_page.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _authLocalDatasource = AuthLocalDatasource();
  List<Map<String, dynamic>> jobExperiences = [
    {
      'image': 'assets/images/avatar.jpg',
      'experienceTitle': 'Mobile Programmer',
      'experienceCompany': 'Telkom Indonesia',
      'experienceLocation': 'Bandung Barat',
      'experienceDate': 'Dec 20 - Feb 21',
    },
  ];

  List<Map<String, dynamic>> educationList = [
    {
      'image': 'assets/images/avatar.jpg',
      'experienceTitle': 'Bachelor of Computer Science',
      'experienceCompany': 'Universitas Indonesia',
      'experienceLocation': 'Depok',
      'experienceDate': '2015 - 2019',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'experienceTitle': 'Master of Information Technology',
      'experienceCompany': 'Bandung Institute of Technology',
      'experienceLocation': 'Bandung',
      'experienceDate': '2020 - 2022',
    },
    {
      'image': 'assets/images/avatar.jpg',
      'experienceTitle': 'Diploma in Software Engineering',
      'experienceCompany': 'Politeknik Elektronika Negeri Surabaya',
      'experienceLocation': 'Surabaya',
      'experienceDate': '2012 - 2015',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      'Edit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          'assets/images/avatar.jpg',
                          width: 104,
                          height: 104,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'John Dae',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mobile Developer',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.verified,
                            color: Colors.blue,
                            size: 12,
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return JobAppliedHistoryPage();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '10',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Applied',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '20',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Reviewed',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  '14',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Interview',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      TitleSection(
                        title: 'Experience',
                        canPress: false,
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: jobExperiences.length,
                          itemBuilder: (context, index) {
                            final job = jobExperiences[index];
                            return CardJob(
                                image: job['image'],
                                experienceTitle: job['experienceTitle'],
                                experiencecompany: job['experienceCompany'],
                                experienceLocation: job['experienceLocation'],
                                experienceDate: job['experienceDate']);
                          }),
                      const SizedBox(height: 22),
                      TitleSection(
                        title: 'Education',
                        canPress: false,
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: educationList.length,
                        itemBuilder: (context, index) {
                          final education = educationList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: CardJob(
                                image: education['image'],
                                experienceTitle: education['experienceTitle'],
                                experiencecompany:
                                    education['experienceCompany'],
                                experienceLocation:
                                    education['experienceLocation'],
                                experienceDate: education['experienceDate']),
                          );
                        },
                      ),
                      const SizedBox(height: 24),
                      //logout button
                      InkWell(
                       onTap: () {
                          _authLocalDatasource.deleteToken();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 48,
                          decoration: BoxDecoration(
                            color: AppColors.primaryBlue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Logout',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
