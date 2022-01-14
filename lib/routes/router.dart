
import 'package:app/screens/booking/booking_page.dart';
import 'package:app/screens/booking/hasbooked.dart';
import 'package:app/screens/enterance/enterance_page.dart';
import 'package:app/screens/filter/filter_page.dart';
import 'package:app/screens/filtered/filtered_page.dart';
import 'package:app/screens/filtered/indivudial/indivudial_page.dart';
import 'package:app/screens/home/home_page.dart';
import 'package:app/screens/payment/myCart/may_cart_page.dart';
import 'package:app/screens/payment/payment_page.dart';
import 'package:app/screens/payment/payment_verify_page.dart';
import 'package:app/screens/signUp/signup_page.dart';
import 'package:app/screens/signin/phoneNumber.dart';
import 'package:app/screens/signin/verify/verify_page.dart';
import 'package:flutter/material.dart';

class GenerateRouter {
  static routeGenerate(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/enterance':
        return MaterialPageRoute(builder: (context) => EnterancePage());
      case '/signup':
        return MaterialPageRoute(builder: (context) => SignUp());
      case '/phoneNumber':
        return MaterialPageRoute(builder: (context) => PhoneNumber());
      case '/verify':
        return MaterialPageRoute(builder: (context) => VerifyPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/filter':
        return MaterialPageRoute(builder: (context) => FilterPage());
      case '/filtered':
        return MaterialPageRoute(builder: (context) => FilteredPage());
      case '/indivudial':
        return MaterialPageRoute(
            builder: (context) => IndivudialPage(
                  forwards: args,
                ));
      case '/booking':
        return MaterialPageRoute(builder: (context) => BookingPage());
      case '/hasbooked':
        return MaterialPageRoute(builder: (context) => HasBooked());
      case '/payment':
        return MaterialPageRoute(builder: (context) => PaymentPage());
      case '/paymentverify':
        return MaterialPageRoute(builder: (context) => PaymentVerify());
      case '/mycart':
        return MaterialPageRoute(builder: (context) => MyCart(myCartInfo: args,));
    }
  }
}
