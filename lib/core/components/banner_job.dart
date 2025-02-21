import 'package:employme/core/constants/colors.dart';
import 'package:employme/core/extensions/string_ext.dart';
import 'package:employme/data/models/respone/job_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BannerJob extends StatefulWidget {
  final Job job;
  const BannerJob({super.key, required this.job});

  @override
  State<BannerJob> createState() => _BannerJobState();
}

class _BannerJobState extends State<BannerJob> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    final job = widget.job;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColors.primaryBlue,
          image: DecorationImage(
              image: const AssetImage('assets/images/overlay_banner.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withValues(alpha: 0.1), BlendMode.modulate))),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: 
                  job.company!.logoPath!.startsWith('http')
                      ? Image.network(
                          job.company!.logoPath!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/avatar.jpg',
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            );
                          },
                        )
                      : Image.asset(
                          job.company!.logoPath!,
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
                      job.title!,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      job.company!.name!,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                )),
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
                        isSaved ? Colors.white : AppColors.darkGrey,
                        BlendMode.srcATop),
                  ),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: Text(
                  job.jobType!.capitalize(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${job.salary!.max!.substring(0, job.salary!.max!.length - 3)}/y',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  job.company!.location!,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
