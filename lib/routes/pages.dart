import 'package:wise_student_app/Screens/Chat/chat_call.dart';
import 'package:wise_student_app/Screens/Chat/chat_main.dart';
import 'package:wise_student_app/Screens/Chat/chat_page.dart';
import 'package:wise_student_app/Screens/Library/book_details.dart';
import 'package:wise_student_app/Screens/Library/library_main.dart';
import 'package:wise_student_app/Screens/Library/shoppingcart.dart';
import 'package:wise_student_app/Screens/News/latest_news.dart';
import 'package:wise_student_app/Screens/News/saved_posts.dart';
import 'package:wise_student_app/Screens/News/draft_posts.dart';
import 'package:wise_student_app/Screens/News/settings_screen.dart';
import 'package:wise_student_app/Screens/Notifications/notifications.dart';
import 'package:wise_student_app/Screens/Profile/Registration/available_classes.dart';
import 'package:wise_student_app/Screens/Profile/Registration/direct_regs.dart';
import 'package:wise_student_app/Screens/Profile/Registration/exam_dates.dart';
import 'package:wise_student_app/Screens/Profile/Registration/payment_screen.dart';
import 'package:wise_student_app/Screens/Profile/Registration/registration_date.dart';
import 'package:wise_student_app/Screens/Profile/Registration/subject_list.dart';
import 'package:wise_student_app/Screens/onbloardscreen/onboard_main.dart';
import 'package:wise_student_app/main.dart';
import 'package:wise_student_app/models/message_model.dart';
import 'package:wise_student_app/models/user_model.dart';
import 'package:wise_student_app/nav_bar.dart';
import 'package:wise_student_app/Screens/LogIn/phone_number.dart';
import 'package:wise_student_app/Screens/News/news_main.dart';
import 'package:wise_student_app/Screens/News/news_details.dart';
import 'package:wise_student_app/routes/routes_string.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: RoutesString.chat,
    page: () => const Chat(),
  ),
  GetPage(
    name: RoutesString.onboard,
    page: () => Onboard(),
  ),
  GetPage(
    name: RoutesString.mainPage,
    page: () => const MainPage(title: ''),
  ),
  GetPage(
    name: RoutesString.news,
    page: () => const News(),
  ),
  GetPage(
    name: RoutesString.library,
    page: () => const Library(),
  ),
  GetPage(
    name: RoutesString.notifications,
    page: () => const Noti(),
  ),
  GetPage(
      name: RoutesString.forgetPassword, page: () => const Forgetpassword()),
  GetPage(name: RoutesString.resetPassword, page: () => const Forgetpassword()),
  GetPage(name: RoutesString.navBar, page: () => const NavBar()),
  GetPage(name: RoutesString.newsDetails, page: () => const NewsDetails()),
  GetPage(name: RoutesString.savedPosts, page: () => const SavedPosts()),
  GetPage(name: RoutesString.draftPosts, page: () => const DraftPosts()),
  GetPage(name: RoutesString.settings, page: () => const Settings()),
  GetPage(name: RoutesString.latestNews, page: () => const LatestNews()),
  GetPage(
    name: RoutesString.chatPage,
    page: () => ChatPage(
        messageItem: Message(
            id: '',
            toId: '',
            fromId: '',
            msg: '',
            type: '',
            createdAt: '',
            read: '',
            message: ''),
        roomId: '',
        student: Std(
            id: '',
            fname: '',
            degree: '',
            major: '',
            academicAdvisor: '',
            stdEmail: '',
            phoneNumber: '',
            eLearningPass: '',
            teamsPass: '',
            image: '',
            lastActivated: '',
            pushToken: '',
            online: true,
            stdId: '',
            myUsers: [])),
  ),
  GetPage(name: RoutesString.chatCall, page: () => const ChatCall()),
  GetPage(
      name: RoutesString.shoppingcart,
      page: () => const ShoppingCart(
            title: '',
            imageAssetPath: '',
            author: '',
            pages: '',
            language: '',
            release: '',
            description: '',
          )),
  GetPage(
      name: RoutesString.bookDetails,
      page: () => const BookDetails(
            category: '',
            author: '',
            title: '',
            imageAssetPath: '',
            pages: '',
            language: '',
            release: '',
            description: '',
          )),
  GetPage(name: RoutesString.directreg, page: () => const DirectRegistration()),
  GetPage(
      name: RoutesString.availableclasses,
      page: () => const AvailableClasses()),
  GetPage(name: RoutesString.regDate, page: () => const RegistrationDate()),
  GetPage(
      name: RoutesString.paymenthour, page: () => const PaymentHourSelection()),
  GetPage(name: RoutesString.subjectList, page: () => const SubjectList()),
  GetPage(name: RoutesString.examsDate, page: () => const ExamsDate()),
];
