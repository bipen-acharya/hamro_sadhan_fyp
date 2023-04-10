import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.tertiary,
        elevation: 5,
        shadowColor: const Color(0xFF494949).withOpacity(0.06),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: theme.colorScheme.secondary,
            ),
          ),
        ),
        title: Text(
          "FAQ",
          style: theme.textTheme.bodyLarge!
              .copyWith(fontSize: 16, color: theme.colorScheme.secondary),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: const [
          // FaqItem(
          //   question:
          //       'What is the first screen that appears when I open the app?',
          //   answer: 'The first screen that appears is the splash screen.',
          // ),
          FaqItem(
            question: 'How can I log in to the app?',
            answer:
                'You can log in to the app by entering your email and password on the login screen',
          ),
          FaqItem(
            question: 'What do I need to do to register in the system?',
            answer:
                'To register in the system, you need to fill in your name, phone number, email, and password on the registration screen.',
          ),
          FaqItem(
            question: 'How do I search for available vehicles?',
            answer:
                'You can search for available vehicles by entering the start date and start time on the home page, or by using the search and advanced search functions to filter by name or category.',
          ),
          FaqItem(
            question: "Can I book multiple vehicles at once?",
            answer:
                "No, you can only book one vehicle at a time. You can only view multiple vehicles",
          ),
          FaqItem(
            question:
                'What personal information do I need to provide when booking a vehicle?',
            answer: 'You need to provide your name, phone number, and age.',
          ),
          FaqItem(
            question: "How can I pay for my booking?",
            answer:
                "You can choose to pay either by cash or using the Khalti online payment system.",
          ),
          FaqItem(
            question: " Can I cancel my booking after it has been placed?",
            answer:
                "Yes, you can cancel your booking from the recent vehicle page.",
          ),
          FaqItem(
            question: " How can I update my profile information?",
            answer:
                "You can update your profile information from the profile page.",
          ),
          FaqItem(
            question: "How can I change my password?",
            answer:
                "You can change your password from the change password page by entering your current password and the new password.",
          ),
          FaqItem(
            question: "How can I reset my password if I forget it?",
            answer:
                "You can reset your password by entering your email on the reset password page, and then entering the valid OTP that will be sent to your email.",
          ),
        ],
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({super.key, required this.question, required this.answer});

  final bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(question),
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    answer,
                    maxLines: 5,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 5,
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}











// Nepal is a beautiful country with a diverse landscape, from the towering Himalayas to the lush valleys and plains. With such diverse terrain and varied climates, transportation is a crucial aspect of daily life in Nepal. The transportation system in Nepal can be challenging, particularly for tourists who are unfamiliar with the local customs and languages. To address this issue, a new app has been developed that makes it easy for locals and tourists alike to find and book the right mode of transportation for their needs.

// The app's interface is simple and user-friendly. When the user opens the app for the first time, they are greeted with a splash screen followed by a login screen. If they don't have an account, they can register easily by filling out their name, phone number, email, and password. Once they have registered, they can log in to the system using their email and password.

// After logging in, the user is directed to the home page, where they can enter the start date and start time of their trip. Once they have entered these details, they can browse through the list of available vehicles that are suitable for their trip. The app also has a search function that allows users to enter the names of specific vehicles they are looking for, and an advanced search function that enables them to filter the vehicles according to their categories, ascending or descending order, and other criteria.

// The vehicles available in the app range from motorbikes and scooters to cars, vans, and buses, depending on the user's needs. Each vehicle has a detailed description that includes its make, model, capacity, and rental fee. Once the user has selected the vehicle they want to book, they can see its details and book it by providing some personal information such as their name, phone number, and age. The app also allows users to choose between two payment methods - cash or Khalti, an online payment system that is widely used in Nepal.

// After the booking is confirmed and payment is made, the app shows the user a summary of their booking, including the vehicle details, booking date, and payment method. Users can also view their booking history and recent vehicles, and cancel their bookings if needed. The app also includes a profile page where users can update their personal information and add a profile picture.

// In addition to the user interface, the app also has a vendor interface and an admin interface. The vendor interface is where the vehicle owners can create, update, and delete their vehicles. They can also view the number of orders for their vehicles and update their profile information. The admin interface is where the system administrator can manage the app's categories, users, vehicles, and orders. The admin can also view their own profile information.

// Overall, this app is a game-changer for transportation in Nepal, as it provides an easy-to-use and convenient way for people to find and book the right mode of transportation for their needs. It's an excellent solution for both locals and tourists who need to navigate the country's complex transportation system, and it's sure to make transportation in Nepal a more enjoyable and stress-free experience for everyone.



