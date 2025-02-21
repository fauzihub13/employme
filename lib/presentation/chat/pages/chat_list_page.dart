import 'package:employme/core/components/chat_card.dart';
import 'package:employme/core/components/custom_appbar.dart';
import 'package:employme/core/components/search_input.dart';
import 'package:employme/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  State<ChatListPage> createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<Map<String, dynamic>> privateChat = [
    {
      'name': 'John Doe',
      'image': 'assets/images/company/company_4.jpeg',
      'message': 'Are you available for an interview tomorrow?',
      'time': '14:12 AM',
      'isRead': false,
      'amount': 1,
    },
    {
      'name': 'Jane Smith',
      'image': 'assets/images/company/company_5.jpeg',
      'message': 'Thanks for your response!',
      'time': '13:45 PM',
      'isRead': true,
      'amount': 0,
    },
    {
      'name': 'Michael Johnson',
      'image': 'assets/images/company/company_3.jpeg',
      'message': 'Let’s schedule a meeting.',
      'time': '10:30 AM',
      'isRead': false,
      'amount': 2,
    },
    {
      'name': 'Emily Davis',
      'image': 'assets/images/company/company_2.jpeg',
      'message': 'Looking forward to our discussion.',
      'time': 'Yesterday',
      'isRead': true,
      'amount': 0,
    },
    {
      'name': 'David Wilson',
      'image': 'assets/images/company/company_1.jpeg',
      'message': 'Can you send me the details?',
      'time': 'Monday',
      'isRead': false,
      'amount': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Chats', canBack: false),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: SearchInput(
                      controller: TextEditingController(),
                      hintText: 'Search message',
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          'assets/icons/filter.svg',
                          colorFilter: const ColorFilter.mode(
                            AppColors.darkGrey,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: privateChat.length,
                  itemBuilder: (context, index) {
                    final chat = privateChat[index];
                    return ChatCard(
                      name: chat['name'],
                      image: chat['image'],
                      message: chat['message'],
                      time: chat['time'],
                      isRead: chat['isRead'],
                      amount: chat['amount'],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
