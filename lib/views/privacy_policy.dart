import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hamro_sadhan/utils/colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

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
          "Privacy Policy",
          style: theme.textTheme.bodyLarge!
              .copyWith(fontSize: 16, color: theme.colorScheme.secondary),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 18, bottom: 15, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Hamro Sadhan Privacy Policy",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Welcome to our vehicle renting app! Our app is designed to provide a seamless vehicle rental experience for users like you. Before using our app, it is important to read and understand our terms and conditions and privacy policy.",
                style: TextStyle(),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  textAlign: TextAlign.justify,
                  "Our terms and conditions outline the rules and expectations for using our app. When you create a user account, you agree to keep your account information secure and up-to-date. You also agree to pay the rental fee plus any applicable taxes and fees when you place an order for a vehicle rental. We accept online payments through the Khalti payment gateway. However, we are not responsible for any issues that arise during the payment process. If you cancel an order, you may be subject to a cancellation fee. It is important to note that the vehicle listings on our app are provided by vendors, and we do not guarantee the accuracy or quality of these listings. Finally, we are not liable for any damages arising from your use of our app or from any vehicle rental."),
              SizedBox(
                height: 10,
              ),
              Text(
                  textAlign: TextAlign.justify,
                  "Our privacy policy explains how we collect, use, and protect your personal information. We collect information from you when you create an account, place an order, or contact us. This information may include your name, email address, phone number, and payment information. We use your personal information to provide our services, process payments, and communicate with you. We take reasonable steps to protect your personal information from unauthorized access or disclosure, but we cannot guarantee the security of your information. We use cookies to improve your experience on our app, but you can disable cookies in your web browser if you prefer."),
              SizedBox(
                height: 10,
              ),
              Text(
                  textAlign: TextAlign.justify,
                  "In summary, we are committed to providing a safe and secure vehicle rental experience for our users. Our terms and conditions and privacy policy are designed to protect your rights and privacy. If you have any questions or concerns, please contact us at support@vehicle-renting-app.com.")
            ],
          ),
        ),
      ),
    );
  }
}
