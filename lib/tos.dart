import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Tos extends StatelessWidget {
  const Tos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    const Center(
                      child: Text(
                        'Term and Conditions',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Color(0xff51A1EC).withOpacity(0.2))),
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xff0779E4),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                const Text(
                    textAlign: TextAlign.justify,
                    '1. Eligibility: By creating an account on our platform, you confirm that you are at least 18 years old and have the legal capacity to enter into a binding agreement.'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    textAlign: TextAlign.justify,
                    '2. Account Information: You agree to provide accurate and complete information when creating an account, including your name, email address, and other necessary details. You are responsible for maintaining the confidentiality of your account information and are liable for any activity that occurs under your account.'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    textAlign: TextAlign.justify,
                    '3. Prohibited Activities: You agree not to use our platform for any illegal or unauthorized purposes. You will not engage in any activity that may cause harm to our platform or its users, including but not limited to spamming, hacking, distributing malware, or engaging in fraudulent activities.'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    textAlign: TextAlign.justify,
                    '4. User Content: You retain ownership of any content you upload or post on our platform. By posting content, you grant us a non-exclusive, transferable, and sub-licensable license to use, copy, modify, distribute, and display your content on our platform.'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    textAlign: TextAlign.justify,
                    '5. Intellectual Property: All intellectual property on our platform, including trademarks, logos, designs, and copyrights, are the property of the platform, and you agree not to use them without our prior written consent.'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    textAlign: TextAlign.justify,
                    '6. Termination: We reserve the right to terminate your account at any time without notice if we suspect any violation of our terms and conditions or any illegal activity. You may also terminate your account at any time by contacting our support team.'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                    textAlign: TextAlign.justify,
                    '7. Disclaimer of Warranties: We provide our platform on an "as is" and "as available" basis, and we do not guarantee that our platform will be error-free, uninterrupted, or secure')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
