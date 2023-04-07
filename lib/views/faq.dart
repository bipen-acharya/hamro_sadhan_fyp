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
      body: Text("FAQ"),
    );
  }
}


// Q: What is the first screen that appears when I open the app?
// A: The first screen that appears is the splash screen.

// Q: How can I log in to the app?
// A: You can log in to the app by entering your email and password on the login screen.

// Q: What do I need to do to register in the system?
// A: To register in the system, you need to fill in your name, phone number, email, and password on the registration screen.

// Q: How do I search for available vehicles?
// A: You can search for available vehicles by entering the start date and start time on the home page, or by using the search and advanced search functions to filter by name or category.

// Q: Can I book multiple vehicles at once?
// A: No, you can only book one vehicle at a time.

// Q: What personal information do I need to provide when booking a vehicle?
// A: You need to provide your name, phone number, and age.

// Q: How can I pay for my booking?
// A: You can choose to pay either by cash or using the Khalti online payment system.

// Q: Can I cancel my booking after it has been placed?
// A: Yes, you can cancel your booking from the recent vehicle page.

// Q: How can I update my profile information?
// A: You can update your profile information from the profile page.

// Q: How can I change my password?
// A: You can change your password from the change password page by entering your current password and the new password.

// Q: How can I reset my password if I forget it?
// A: You can reset your password by entering your email on the reset password page, and then entering the valid OTP that will be sent to your email.




// About Us:

// Our app is designed to provide a seamless experience for users who are looking to book vehicles for their travel needs. Our mission is to simplify the process of finding and booking a vehicle by providing a user-friendly platform that can be easily accessed from anywhere. We understand the importance of reliable transportation, and we aim to provide a solution that is both convenient and affordable.

// Our app allows users to filter through various types of vehicles to find the one that best suits their needs. Whether it's a bike for a quick ride around town or a car for a long road trip, we have a wide selection of vehicles available for booking. Our app also provides users with the option to choose between cash or online payment via Khalti for a hassle-free booking experience.

// In addition to providing a smooth user experience, we also value the security and privacy of our users. Our system ensures that all personal information is kept safe and secure. Users can also rest assured that their transactions are encrypted and protected against any unauthorized access.

// We also understand the importance of partnerships in providing the best service possible. Our app allows vendors to easily post and manage their vehicles on our platform, providing users with a wider selection of vehicles to choose from. Our admin team ensures that all listings are accurate and up-to-date, ensuring a high level of customer satisfaction.

// Overall, we strive to provide an easy and reliable booking experience for our users while maintaining a high standard of security and privacy. We are committed to continuously improving our app and partnering with vendors to provide a wide selection of vehicles for our users. Thank you for choosing our app for your travel needs.




// Nepal is a beautiful country with a diverse landscape, from the towering Himalayas to the lush valleys and plains. With such diverse terrain and varied climates, transportation is a crucial aspect of daily life in Nepal. The transportation system in Nepal can be challenging, particularly for tourists who are unfamiliar with the local customs and languages. To address this issue, a new app has been developed that makes it easy for locals and tourists alike to find and book the right mode of transportation for their needs.

// The app's interface is simple and user-friendly. When the user opens the app for the first time, they are greeted with a splash screen followed by a login screen. If they don't have an account, they can register easily by filling out their name, phone number, email, and password. Once they have registered, they can log in to the system using their email and password.

// After logging in, the user is directed to the home page, where they can enter the start date and start time of their trip. Once they have entered these details, they can browse through the list of available vehicles that are suitable for their trip. The app also has a search function that allows users to enter the names of specific vehicles they are looking for, and an advanced search function that enables them to filter the vehicles according to their categories, ascending or descending order, and other criteria.

// The vehicles available in the app range from motorbikes and scooters to cars, vans, and buses, depending on the user's needs. Each vehicle has a detailed description that includes its make, model, capacity, and rental fee. Once the user has selected the vehicle they want to book, they can see its details and book it by providing some personal information such as their name, phone number, and age. The app also allows users to choose between two payment methods - cash or Khalti, an online payment system that is widely used in Nepal.

// After the booking is confirmed and payment is made, the app shows the user a summary of their booking, including the vehicle details, booking date, and payment method. Users can also view their booking history and recent vehicles, and cancel their bookings if needed. The app also includes a profile page where users can update their personal information and add a profile picture.

// In addition to the user interface, the app also has a vendor interface and an admin interface. The vendor interface is where the vehicle owners can create, update, and delete their vehicles. They can also view the number of orders for their vehicles and update their profile information. The admin interface is where the system administrator can manage the app's categories, users, vehicles, and orders. The admin can also view their own profile information.

// Overall, this app is a game-changer for transportation in Nepal, as it provides an easy-to-use and convenient way for people to find and book the right mode of transportation for their needs. It's an excellent solution for both locals and tourists who need to navigate the country's complex transportation system, and it's sure to make transportation in Nepal a more enjoyable and stress-free experience for everyone.



