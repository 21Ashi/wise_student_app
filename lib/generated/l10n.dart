// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get Title {
    return Intl.message(
      'Login',
      name: 'Title',
      desc: '',
      args: [],
    );
  }

  /// `University Email`
  String get Uniemail {
    return Intl.message(
      'University Email',
      name: 'Uniemail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Forget password?`
  String get ForgetPassword {
    return Intl.message(
      'Forget password?',
      name: 'ForgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Rememebr me`
  String get RememberMe {
    return Intl.message(
      'Rememebr me',
      name: 'RememberMe',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get Verification {
    return Intl.message(
      'Verification',
      name: 'Verification',
      desc: '',
      args: [],
    );
  }

  /// `we just need your registered phone number \nto send you password reset code`
  String get UnderVerifaction {
    return Intl.message(
      'we just need your registered phone number \nto send you password reset code',
      name: 'UnderVerifaction',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get ResetPassword {
    return Intl.message(
      'Reset Password',
      name: 'ResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the verification code we just sent \nyou on your registered phone number`
  String get UnderVerification2 {
    return Intl.message(
      'Enter the verification code we just sent \nyou on your registered phone number',
      name: 'UnderVerification2',
      desc: '',
      args: [],
    );
  }

  /// `Enter Code Here`
  String get EnterCode {
    return Intl.message(
      'Enter Code Here',
      name: 'EnterCode',
      desc: '',
      args: [],
    );
  }

  /// `If you did not receive the code?`
  String get UnderCode {
    return Intl.message(
      'If you did not receive the code?',
      name: 'UnderCode',
      desc: '',
      args: [],
    );
  }

  /// ` Resend`
  String get UnderCode2 {
    return Intl.message(
      ' Resend',
      name: 'UnderCode2',
      desc: '',
      args: [],
    );
  }

  /// `Having trouble?`
  String get UnderVerifyButton1 {
    return Intl.message(
      'Having trouble?',
      name: 'UnderVerifyButton1',
      desc: '',
      args: [],
    );
  }

  /// ` Get Help`
  String get UnderVerifyButton2 {
    return Intl.message(
      ' Get Help',
      name: 'UnderVerifyButton2',
      desc: '',
      args: [],
    );
  }

  /// `Your new password should be different\n from passwords previously used`
  String get UnderResetPassword {
    return Intl.message(
      'Your new password should be different\n from passwords previously used',
      name: 'UnderResetPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Contains at least 6 Characters`
  String get Constraint1 {
    return Intl.message(
      'Contains at least 6 Characters',
      name: 'Constraint1',
      desc: '',
      args: [],
    );
  }

  /// `Contains at least 1 number`
  String get Constraint2 {
    return Intl.message(
      'Contains at least 1 number',
      name: 'Constraint2',
      desc: '',
      args: [],
    );
  }

  /// `Contains at least 1 special character`
  String get Constraint3 {
    return Intl.message(
      'Contains at least 1 special character',
      name: 'Constraint3',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get VerifyButton {
    return Intl.message(
      'Verify',
      name: 'VerifyButton',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Passowrd`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Passowrd',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Matched password`
  String get Constraint4 {
    return Intl.message(
      'Matched password',
      name: 'Constraint4',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get ConfirmButton {
    return Intl.message(
      'Confirm',
      name: 'ConfirmButton',
      desc: '',
      args: [],
    );
  }

  /// `Start Using`
  String get StartUsing {
    return Intl.message(
      'Start Using',
      name: 'StartUsing',
      desc: '',
      args: [],
    );
  }

  /// `News`
  String get News {
    return Intl.message(
      'News',
      name: 'News',
      desc: '',
      args: [],
    );
  }

  /// `World Islamic Sciences & Education`
  String get UnderNews1 {
    return Intl.message(
      'World Islamic Sciences & Education',
      name: 'UnderNews1',
      desc: '',
      args: [],
    );
  }

  /// `University Latest News`
  String get UnderNews2 {
    return Intl.message(
      'University Latest News',
      name: 'UnderNews2',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get Library {
    return Intl.message(
      'Library',
      name: 'Library',
      desc: '',
      args: [],
    );
  }

  /// `Here You Can Find Every Book`
  String get UnderLibrary1 {
    return Intl.message(
      'Here You Can Find Every Book',
      name: 'UnderLibrary1',
      desc: '',
      args: [],
    );
  }

  /// `You Are Looking For`
  String get UnderLibrary2 {
    return Intl.message(
      'You Are Looking For',
      name: 'UnderLibrary2',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get Chat {
    return Intl.message(
      'Chat',
      name: 'Chat',
      desc: '',
      args: [],
    );
  }

  /// `Quick And Simple Way To`
  String get UnderChat1 {
    return Intl.message(
      'Quick And Simple Way To',
      name: 'UnderChat1',
      desc: '',
      args: [],
    );
  }

  /// `Send And Recieve Text Messages`
  String get UnderChat2 {
    return Intl.message(
      'Send And Recieve Text Messages',
      name: 'UnderChat2',
      desc: '',
      args: [],
    );
  }

  /// `Test Bank`
  String get TestBank {
    return Intl.message(
      'Test Bank',
      name: 'TestBank',
      desc: '',
      args: [],
    );
  }

  /// `We Also Have The Best Test Bank`
  String get UnderTestBank1 {
    return Intl.message(
      'We Also Have The Best Test Bank',
      name: 'UnderTestBank1',
      desc: '',
      args: [],
    );
  }

  /// `For All Your Subjects`
  String get UnderTestBank2 {
    return Intl.message(
      'For All Your Subjects',
      name: 'UnderTestBank2',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get Support {
    return Intl.message(
      'Support',
      name: 'Support',
      desc: '',
      args: [],
    );
  }

  /// `Get Reliable Support`
  String get UnderSupport1 {
    return Intl.message(
      'Get Reliable Support',
      name: 'UnderSupport1',
      desc: '',
      args: [],
    );
  }

  /// `With Our Application`
  String get UnderSupport2 {
    return Intl.message(
      'With Our Application',
      name: 'UnderSupport2',
      desc: '',
      args: [],
    );
  }

  /// `Latest News`
  String get LatestNews {
    return Intl.message(
      'Latest News',
      name: 'LatestNews',
      desc: '',
      args: [],
    );
  }

  /// `See more`
  String get SeeMore {
    return Intl.message(
      'See more',
      name: 'SeeMore',
      desc: '',
      args: [],
    );
  }

  /// `The Omani Embassy meets its students at the Wise University`
  String get SpecifiedNews {
    return Intl.message(
      'The Omani Embassy meets its students at the Wise University',
      name: 'SpecifiedNews',
      desc: '',
      args: [],
    );
  }

  /// ` 20.NOV.2023`
  String get SpecifiedNewsDate {
    return Intl.message(
      ' 20.NOV.2023',
      name: 'SpecifiedNewsDate',
      desc: '',
      args: [],
    );
  }

  /// `By Wise Admin`
  String get SpecifiedNewsAdmin {
    return Intl.message(
      'By Wise Admin',
      name: 'SpecifiedNewsAdmin',
      desc: '',
      args: [],
    );
  }

  /// `You Have Added This Post To BookMark`
  String get BookMark {
    return Intl.message(
      'You Have Added This Post To BookMark',
      name: 'BookMark',
      desc: '',
      args: [],
    );
  }

  /// `Post Already Saved`
  String get BookMark2 {
    return Intl.message(
      'Post Already Saved',
      name: 'BookMark2',
      desc: '',
      args: [],
    );
  }

  /// `Copy the link or share it from below.`
  String get Share {
    return Intl.message(
      'Copy the link or share it from below.',
      name: 'Share',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get Author {
    return Intl.message(
      'Author',
      name: 'Author',
      desc: '',
      args: [],
    );
  }

  /// `In a meeting filled with love and friendliness, His Excellency Professor Dr. Jaafar Mahmoud Al-Fanatsa, President of the University, met with His Excellency First Secretary Salem bin Sulaiman Al-Wahaibi, Charge d’Affairs of the Cultural Department at the Embassy of the Sultanate of Oman. On the sidelines of the visit, which was attended by the head of the academic department at the embassy, Dr. Abdullah Obaidat, and a number of faculty and administrative staff members at the university, they met with our students at the university from the sisterly Sultanate of Oman and listened to their observations. At the conclusion of the visit, the two parties exchanged shields of appreciation.`
  String get PostDetails {
    return Intl.message(
      'In a meeting filled with love and friendliness, His Excellency Professor Dr. Jaafar Mahmoud Al-Fanatsa, President of the University, met with His Excellency First Secretary Salem bin Sulaiman Al-Wahaibi, Charge d’Affairs of the Cultural Department at the Embassy of the Sultanate of Oman. On the sidelines of the visit, which was attended by the head of the academic department at the embassy, Dr. Abdullah Obaidat, and a number of faculty and administrative staff members at the university, they met with our students at the university from the sisterly Sultanate of Oman and listened to their observations. At the conclusion of the visit, the two parties exchanged shields of appreciation.',
      name: 'PostDetails',
      desc: '',
      args: [],
    );
  }

  /// `Fname`
  String get Fname {
    return Intl.message(
      'Fname',
      name: 'Fname',
      desc: '',
      args: [],
    );
  }

  /// ` Lname`
  String get Lname {
    return Intl.message(
      ' Lname',
      name: 'Lname',
      desc: '',
      args: [],
    );
  }

  /// `User Email here`
  String get email {
    return Intl.message(
      'User Email here',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Saved Posts`
  String get SavedPosts {
    return Intl.message(
      'Saved Posts',
      name: 'SavedPosts',
      desc: '',
      args: [],
    );
  }

  /// `Draft Posts`
  String get DraftPosts {
    return Intl.message(
      'Draft Posts',
      name: 'DraftPosts',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Only you can see the posts you have saved`
  String get UnderSavedPosts {
    return Intl.message(
      'Only you can see the posts you have saved',
      name: 'UnderSavedPosts',
      desc: '',
      args: [],
    );
  }

  /// `Post Deleted`
  String get PostDeleted {
    return Intl.message(
      'Post Deleted',
      name: 'PostDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get undo {
    return Intl.message(
      'Undo',
      name: 'undo',
      desc: '',
      args: [],
    );
  }

  /// `Only you can see this`
  String get UnderDraftPosts {
    return Intl.message(
      'Only you can see this',
      name: 'UnderDraftPosts',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get NavHome {
    return Intl.message(
      'Home',
      name: 'NavHome',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get NavLibrary {
    return Intl.message(
      'Library',
      name: 'NavLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get NavNotifications {
    return Intl.message(
      'Notifications',
      name: 'NavNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Chat`
  String get NavChat {
    return Intl.message(
      'Chat',
      name: 'NavChat',
      desc: '',
      args: [],
    );
  }

  /// `Receive notifications of new things to\nsuit your interests.`
  String get UnderNotifications {
    return Intl.message(
      'Receive notifications of new things to\nsuit your interests.',
      name: 'UnderNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get DarkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'DarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Change the theme to dark mode.`
  String get UnderDarkTheme {
    return Intl.message(
      'Change the theme to dark mode.',
      name: 'UnderDarkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get Languages {
    return Intl.message(
      'Languages',
      name: 'Languages',
      desc: '',
      args: [],
    );
  }

  /// `Change the language between\nArabic or English.`
  String get UnderLangauages {
    return Intl.message(
      'Change the language between\nArabic or English.',
      name: 'UnderLangauages',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get Change {
    return Intl.message(
      'Change',
      name: 'Change',
      desc: '',
      args: [],
    );
  }

  /// `Change your password?`
  String get ChangeText {
    return Intl.message(
      'Change your password?',
      name: 'ChangeText',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get Close {
    return Intl.message(
      'Close',
      name: 'Close',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Log out of your account?`
  String get LogoutText {
    return Intl.message(
      'Log out of your account?',
      name: 'LogoutText',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get LogoutButton {
    return Intl.message(
      'Logout',
      name: 'LogoutButton',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get Enlgish {
    return Intl.message(
      'English',
      name: 'Enlgish',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `New Post`
  String get NewPost {
    return Intl.message(
      'New Post',
      name: 'NewPost',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get NewPostTitle {
    return Intl.message(
      'Title',
      name: 'NewPostTitle',
      desc: '',
      args: [],
    );
  }

  /// `Whats Happening`
  String get NewPostDescription {
    return Intl.message(
      'Whats Happening',
      name: 'NewPostDescription',
      desc: '',
      args: [],
    );
  }

  /// `Time : `
  String get NewPostTime {
    return Intl.message(
      'Time : ',
      name: 'NewPostTime',
      desc: '',
      args: [],
    );
  }

  /// `Date : `
  String get NewPostDate {
    return Intl.message(
      'Date : ',
      name: 'NewPostDate',
      desc: '',
      args: [],
    );
  }

  /// `  Everyone who can view this post`
  String get NewPostButton1 {
    return Intl.message(
      '  Everyone who can view this post',
      name: 'NewPostButton1',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Settings`
  String get PrivacySettings {
    return Intl.message(
      'Privacy Settings',
      name: 'PrivacySettings',
      desc: '',
      args: [],
    );
  }

  /// `Who can view this post`
  String get UnderPrivSettings {
    return Intl.message(
      'Who can view this post',
      name: 'UnderPrivSettings',
      desc: '',
      args: [],
    );
  }

  /// `Everyone`
  String get Everyone {
    return Intl.message(
      'Everyone',
      name: 'Everyone',
      desc: '',
      args: [],
    );
  }

  /// `Who Can See This : `
  String get WhoCanSeeThis {
    return Intl.message(
      'Who Can See This : ',
      name: 'WhoCanSeeThis',
      desc: '',
      args: [],
    );
  }

  /// `Friends`
  String get Friends {
    return Intl.message(
      'Friends',
      name: 'Friends',
      desc: '',
      args: [],
    );
  }

  /// `Only Me`
  String get OnlyMe {
    return Intl.message(
      'Only Me',
      name: 'OnlyMe',
      desc: '',
      args: [],
    );
  }

  /// `Schedule your post for later`
  String get SchedulePost {
    return Intl.message(
      'Schedule your post for later',
      name: 'SchedulePost',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Share to`
  String get ShareTo {
    return Intl.message(
      'Share to',
      name: 'ShareTo',
      desc: '',
      args: [],
    );
  }

  /// `Post it`
  String get PostIT {
    return Intl.message(
      'Post it',
      name: 'PostIT',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get Search {
    return Intl.message(
      'Search...',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `New Collection`
  String get NewCollection {
    return Intl.message(
      'New Collection',
      name: 'NewCollection',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get BookTitle {
    return Intl.message(
      'Title',
      name: 'BookTitle',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get Popular {
    return Intl.message(
      'Popular',
      name: 'Popular',
      desc: '',
      args: [],
    );
  }

  /// `Art`
  String get Art {
    return Intl.message(
      'Art',
      name: 'Art',
      desc: '',
      args: [],
    );
  }

  /// `Business`
  String get business {
    return Intl.message(
      'Business',
      name: 'business',
      desc: '',
      args: [],
    );
  }

  /// `IT`
  String get IT {
    return Intl.message(
      'IT',
      name: 'IT',
      desc: '',
      args: [],
    );
  }

  /// `Management`
  String get Management {
    return Intl.message(
      'Management',
      name: 'Management',
      desc: '',
      args: [],
    );
  }

  /// `Design`
  String get Design {
    return Intl.message(
      'Design',
      name: 'Design',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get BookAuthor {
    return Intl.message(
      'Author',
      name: 'BookAuthor',
      desc: '',
      args: [],
    );
  }

  /// `Book Details`
  String get BookDetails {
    return Intl.message(
      'Book Details',
      name: 'BookDetails',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get BookCategory {
    return Intl.message(
      'Category',
      name: 'BookCategory',
      desc: '',
      args: [],
    );
  }

  /// `Page`
  String get BookPage {
    return Intl.message(
      'Page',
      name: 'BookPage',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get BookLanguage {
    return Intl.message(
      'Language',
      name: 'BookLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Release`
  String get BookRelease {
    return Intl.message(
      'Release',
      name: 'BookRelease',
      desc: '',
      args: [],
    );
  }

  /// `This book is intended for a one-semester, beginner’s level course on Java programming. It includes the new features included in JDK1.7. Each of its 16 chapters provide review questions for the readers to self-test their learning. “Try It Out” programs that enable the readers to develop programs for real life problems have also been included. Introduction to Java Programming will help budding programmers solidify their foundation on Java and move on to higher level topics like Swing, JDBC, Servlets etc. Key Features• Simple presentation with an in-depth explanation of concepts up to the required level• Complete programs provided for each concept• New features included in JDK1.7• Updated to J2SE7• Uses the recently introduced printf() method defined in Console class instead of the classical statement System.out.println().`
  String get Bookinfo {
    return Intl.message(
      'This book is intended for a one-semester, beginner’s level course on Java programming. It includes the new features included in JDK1.7. Each of its 16 chapters provide review questions for the readers to self-test their learning. “Try It Out” programs that enable the readers to develop programs for real life problems have also been included. Introduction to Java Programming will help budding programmers solidify their foundation on Java and move on to higher level topics like Swing, JDBC, Servlets etc. Key Features• Simple presentation with an in-depth explanation of concepts up to the required level• Complete programs provided for each concept• New features included in JDK1.7• Updated to J2SE7• Uses the recently introduced printf() method defined in Console class instead of the classical statement System.out.println().',
      name: 'Bookinfo',
      desc: '',
      args: [],
    );
  }

  /// `Borrow`
  String get Borrow {
    return Intl.message(
      'Borrow',
      name: 'Borrow',
      desc: '',
      args: [],
    );
  }

  /// `Add Book`
  String get AddBook {
    return Intl.message(
      'Add Book',
      name: 'AddBook',
      desc: '',
      args: [],
    );
  }

  /// `Type here`
  String get TypeHere {
    return Intl.message(
      'Type here',
      name: 'TypeHere',
      desc: '',
      args: [],
    );
  }

  /// `Page`
  String get Page {
    return Intl.message(
      'Page',
      name: 'Page',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get Cancel {
    return Intl.message(
      'Cancel',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get Shoppingcart {
    return Intl.message(
      'Shopping Cart',
      name: 'Shoppingcart',
      desc: '',
      args: [],
    );
  }

  /// `Borrowed for 5 days only`
  String get BorrowTime {
    return Intl.message(
      'Borrowed for 5 days only',
      name: 'BorrowTime',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get NotificationTitle {
    return Intl.message(
      'Notifications',
      name: 'NotificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get Today {
    return Intl.message(
      'Today',
      name: 'Today',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get Yesterday {
    return Intl.message(
      'Yesterday',
      name: 'Yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Last 7 days`
  String get LastWeek {
    return Intl.message(
      'Last 7 days',
      name: 'LastWeek',
      desc: '',
      args: [],
    );
  }

  /// `Last 30 days`
  String get LastMonth {
    return Intl.message(
      'Last 30 days',
      name: 'LastMonth',
      desc: '',
      args: [],
    );
  }

  /// `Amal James`
  String get Sender {
    return Intl.message(
      'Amal James',
      name: 'Sender',
      desc: '',
      args: [],
    );
  }

  /// `has texted you`
  String get Message {
    return Intl.message(
      'has texted you',
      name: 'Message',
      desc: '',
      args: [],
    );
  }

  /// `2h`
  String get Time {
    return Intl.message(
      '2h',
      name: 'Time',
      desc: '',
      args: [],
    );
  }

  /// `Sender Name`
  String get SenderName {
    return Intl.message(
      'Sender Name',
      name: 'SenderName',
      desc: '',
      args: [],
    );
  }

  /// `timestamp`
  String get Timestamp {
    return Intl.message(
      'timestamp',
      name: 'Timestamp',
      desc: '',
      args: [],
    );
  }

  /// `message text`
  String get MessageText {
    return Intl.message(
      'message text',
      name: 'MessageText',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get GoodMornaing {
    return Intl.message(
      'Good Morning',
      name: 'GoodMornaing',
      desc: '',
      args: [],
    );
  }

  /// `Abdelmajeed Ashi`
  String get UserName {
    return Intl.message(
      'Abdelmajeed Ashi',
      name: 'UserName',
      desc: '',
      args: [],
    );
  }

  /// `Today 4:07PM`
  String get DateDay {
    return Intl.message(
      'Today 4:07PM',
      name: 'DateDay',
      desc: '',
      args: [],
    );
  }

  /// `Active 10m ago`
  String get LastSeen {
    return Intl.message(
      'Active 10m ago',
      name: 'LastSeen',
      desc: '',
      args: [],
    );
  }

  /// `calling`
  String get Calling {
    return Intl.message(
      'calling',
      name: 'Calling',
      desc: '',
      args: [],
    );
  }

  /// `Chat Deleted`
  String get ChatDeleted {
    return Intl.message(
      'Chat Deleted',
      name: 'ChatDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Undo`
  String get Undo {
    return Intl.message(
      'Undo',
      name: 'Undo',
      desc: '',
      args: [],
    );
  }

  /// `Create Group`
  String get CreateGroup {
    return Intl.message(
      'Create Group',
      name: 'CreateGroup',
      desc: '',
      args: [],
    );
  }

  /// `Choose members for create a group`
  String get ChooseMember {
    return Intl.message(
      'Choose members for create a group',
      name: 'ChooseMember',
      desc: '',
      args: [],
    );
  }

  /// `Members 9`
  String get MembersNumber {
    return Intl.message(
      'Members 9',
      name: 'MembersNumber',
      desc: '',
      args: [],
    );
  }

  /// `Create New Group`
  String get NewGroup {
    return Intl.message(
      'Create New Group',
      name: 'NewGroup',
      desc: '',
      args: [],
    );
  }

  /// `Student Profile`
  String get StudentProfile {
    return Intl.message(
      'Student Profile',
      name: 'StudentProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get Registration {
    return Intl.message(
      'Registration',
      name: 'Registration',
      desc: '',
      args: [],
    );
  }

  /// `Student`
  String get Student {
    return Intl.message(
      'Student',
      name: 'Student',
      desc: '',
      args: [],
    );
  }

  /// `Direct Registration`
  String get DirectRegistration {
    return Intl.message(
      'Direct Registration',
      name: 'DirectRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Mandatory College Requirements`
  String get MandatoryCollege {
    return Intl.message(
      'Mandatory College Requirements',
      name: 'MandatoryCollege',
      desc: '',
      args: [],
    );
  }

  /// `Available Classes`
  String get AvailableClasses {
    return Intl.message(
      'Available Classes',
      name: 'AvailableClasses',
      desc: '',
      args: [],
    );
  }

  /// `Registration Date`
  String get RegistrationDate {
    return Intl.message(
      'Registration Date',
      name: 'RegistrationDate',
      desc: '',
      args: [],
    );
  }

  /// `Payment Hours Selection`
  String get PaymentSelection {
    return Intl.message(
      'Payment Hours Selection',
      name: 'PaymentSelection',
      desc: '',
      args: [],
    );
  }

  /// `Subjects List`
  String get SubjectsList {
    return Intl.message(
      'Subjects List',
      name: 'SubjectsList',
      desc: '',
      args: [],
    );
  }

  /// `Exams Date`
  String get ExamsDate {
    return Intl.message(
      'Exams Date',
      name: 'ExamsDate',
      desc: '',
      args: [],
    );
  }

  /// `Profile Information`
  String get ProfileInformation {
    return Intl.message(
      'Profile Information',
      name: 'ProfileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Your Schedule`
  String get YourSchedule {
    return Intl.message(
      'Your Schedule',
      name: 'YourSchedule',
      desc: '',
      args: [],
    );
  }

  /// `Studying Plan`
  String get StudyingPlan {
    return Intl.message(
      'Studying Plan',
      name: 'StudyingPlan',
      desc: '',
      args: [],
    );
  }

  /// `Disciplinary penalties`
  String get Disciplinarypenalties {
    return Intl.message(
      'Disciplinary penalties',
      name: 'Disciplinarypenalties',
      desc: '',
      args: [],
    );
  }

  /// `Marks`
  String get Marks {
    return Intl.message(
      'Marks',
      name: 'Marks',
      desc: '',
      args: [],
    );
  }

  /// `Electronic requests`
  String get Electronicrequests {
    return Intl.message(
      'Electronic requests',
      name: 'Electronicrequests',
      desc: '',
      args: [],
    );
  }

  /// `Course Name`
  String get Coursename {
    return Intl.message(
      'Course Name',
      name: 'Coursename',
      desc: '',
      args: [],
    );
  }

  /// `Course ID`
  String get CourseID {
    return Intl.message(
      'Course ID',
      name: 'CourseID',
      desc: '',
      args: [],
    );
  }

  /// `First exam`
  String get FirstExam {
    return Intl.message(
      'First exam',
      name: 'FirstExam',
      desc: '',
      args: [],
    );
  }

  /// `Second exam`
  String get SecondExam {
    return Intl.message(
      'Second exam',
      name: 'SecondExam',
      desc: '',
      args: [],
    );
  }

  /// `Semester works`
  String get SemesterWorks {
    return Intl.message(
      'Semester works',
      name: 'SemesterWorks',
      desc: '',
      args: [],
    );
  }

  /// `Pass`
  String get pass {
    return Intl.message(
      'Pass',
      name: 'pass',
      desc: '',
      args: [],
    );
  }

  /// `Fail`
  String get fail {
    return Intl.message(
      'Fail',
      name: 'fail',
      desc: '',
      args: [],
    );
  }

  /// `Computer`
  String get computer {
    return Intl.message(
      'Computer',
      name: 'computer',
      desc: '',
      args: [],
    );
  }

  /// `Final Mark`
  String get Finalmark {
    return Intl.message(
      'Final Mark',
      name: 'Finalmark',
      desc: '',
      args: [],
    );
  }

  /// `Credit Hours Per Semester`
  String get CreditHrs {
    return Intl.message(
      'Credit Hours Per Semester',
      name: 'CreditHrs',
      desc: '',
      args: [],
    );
  }

  /// `Total Credit Hrs`
  String get TotalCredit {
    return Intl.message(
      'Total Credit Hrs',
      name: 'TotalCredit',
      desc: '',
      args: [],
    );
  }

  /// `Successful Credit Hours`
  String get SeccesHrs {
    return Intl.message(
      'Successful Credit Hours',
      name: 'SeccesHrs',
      desc: '',
      args: [],
    );
  }

  /// `Cumulative GPA Hours`
  String get CumulativeGPA {
    return Intl.message(
      'Cumulative GPA Hours',
      name: 'CumulativeGPA',
      desc: '',
      args: [],
    );
  }

  /// `SemesterGPA`
  String get SemesterGPA {
    return Intl.message(
      'SemesterGPA',
      name: 'SemesterGPA',
      desc: '',
      args: [],
    );
  }

  /// `Mark In Symbols`
  String get markinsymbols {
    return Intl.message(
      'Mark In Symbols',
      name: 'markinsymbols',
      desc: '',
      args: [],
    );
  }

  /// `Notes`
  String get notes {
    return Intl.message(
      'Notes',
      name: 'notes',
      desc: '',
      args: [],
    );
  }

  /// `Enter Course ID`
  String get entercourseid {
    return Intl.message(
      'Enter Course ID',
      name: 'entercourseid',
      desc: '',
      args: [],
    );
  }

  /// `Select the days`
  String get selectDays {
    return Intl.message(
      'Select the days',
      name: 'selectDays',
      desc: '',
      args: [],
    );
  }

  /// `Select the period`
  String get selecttheperion {
    return Intl.message(
      'Select the period',
      name: 'selecttheperion',
      desc: '',
      args: [],
    );
  }

  /// `Request Status`
  String get requestStatus {
    return Intl.message(
      'Request Status',
      name: 'requestStatus',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message(
      'In Progress',
      name: 'inProgress',
      desc: '',
      args: [],
    );
  }

  /// `No Progress Yet`
  String get noprogress {
    return Intl.message(
      'No Progress Yet',
      name: 'noprogress',
      desc: '',
      args: [],
    );
  }

  /// `Accepted`
  String get accepted {
    return Intl.message(
      'Accepted',
      name: 'accepted',
      desc: '',
      args: [],
    );
  }

  /// `Student ID`
  String get StudentID {
    return Intl.message(
      'Student ID',
      name: 'StudentID',
      desc: '',
      args: [],
    );
  }

  /// `Student Email`
  String get StudentEmail {
    return Intl.message(
      'Student Email',
      name: 'StudentEmail',
      desc: '',
      args: [],
    );
  }

  /// `Academic Advisor`
  String get AcademicAdvisor {
    return Intl.message(
      'Academic Advisor',
      name: 'AcademicAdvisor',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message(
      'Date',
      name: 'Date',
      desc: '',
      args: [],
    );
  }

  /// `C.H`
  String get CH {
    return Intl.message(
      'C.H',
      name: 'CH',
      desc: '',
      args: [],
    );
  }

  /// `Period`
  String get period {
    return Intl.message(
      'Period',
      name: 'period',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get Days {
    return Intl.message(
      'Days',
      name: 'Days',
      desc: '',
      args: [],
    );
  }

  /// `Dr Name`
  String get instructorName {
    return Intl.message(
      'Dr Name',
      name: 'instructorName',
      desc: '',
      args: [],
    );
  }

  /// `Section Number`
  String get SectionNumber {
    return Intl.message(
      'Section Number',
      name: 'SectionNumber',
      desc: '',
      args: [],
    );
  }

  /// `Mandatory University Requirements`
  String get MandatoryUniversity {
    return Intl.message(
      'Mandatory University Requirements',
      name: 'MandatoryUniversity',
      desc: '',
      args: [],
    );
  }

  /// `Mandatory Major Requirements`
  String get MandatoryMajor {
    return Intl.message(
      'Mandatory Major Requirements',
      name: 'MandatoryMajor',
      desc: '',
      args: [],
    );
  }

  /// `Elective Major Requirements`
  String get ElectiveMajor {
    return Intl.message(
      'Elective Major Requirements',
      name: 'ElectiveMajor',
      desc: '',
      args: [],
    );
  }

  /// `Elective University Requirements`
  String get ElectiveUni {
    return Intl.message(
      'Elective University Requirements',
      name: 'ElectiveUni',
      desc: '',
      args: [],
    );
  }

  /// `Compulsory Specialization Requirements`
  String get compulsory {
    return Intl.message(
      'Compulsory Specialization Requirements',
      name: 'compulsory',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get Day {
    return Intl.message(
      'Day',
      name: 'Day',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get ETime {
    return Intl.message(
      'Time',
      name: 'ETime',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get Location {
    return Intl.message(
      'Location',
      name: 'Location',
      desc: '',
      args: [],
    );
  }

  /// `Database`
  String get Database {
    return Intl.message(
      'Database',
      name: 'Database',
      desc: '',
      args: [],
    );
  }

  /// `Software Testing`
  String get STesting {
    return Intl.message(
      'Software Testing',
      name: 'STesting',
      desc: '',
      args: [],
    );
  }

  /// `project Management`
  String get SPM {
    return Intl.message(
      'project Management',
      name: 'SPM',
      desc: '',
      args: [],
    );
  }

  /// `Operating system`
  String get OS {
    return Intl.message(
      'Operating system',
      name: 'OS',
      desc: '',
      args: [],
    );
  }

  /// `Statistics and probability`
  String get SaP {
    return Intl.message(
      'Statistics and probability',
      name: 'SaP',
      desc: '',
      args: [],
    );
  }

  /// `Sunday`
  String get Sunday {
    return Intl.message(
      'Sunday',
      name: 'Sunday',
      desc: '',
      args: [],
    );
  }

  /// `Monday`
  String get Monday {
    return Intl.message(
      'Monday',
      name: 'Monday',
      desc: '',
      args: [],
    );
  }

  /// `Tuesday`
  String get Tuesday {
    return Intl.message(
      'Tuesday',
      name: 'Tuesday',
      desc: '',
      args: [],
    );
  }

  /// `Wednesday`
  String get Wednesday {
    return Intl.message(
      'Wednesday',
      name: 'Wednesday',
      desc: '',
      args: [],
    );
  }

  /// `Thursday`
  String get Thursday {
    return Intl.message(
      'Thursday',
      name: 'Thursday',
      desc: '',
      args: [],
    );
  }

  /// `Friday`
  String get Friday {
    return Intl.message(
      'Friday',
      name: 'Friday',
      desc: '',
      args: [],
    );
  }

  /// `Sutarday`
  String get Sutarday {
    return Intl.message(
      'Sutarday',
      name: 'Sutarday',
      desc: '',
      args: [],
    );
  }

  /// `Number of Hours`
  String get NumberOfHours {
    return Intl.message(
      'Number of Hours',
      name: 'NumberOfHours',
      desc: '',
      args: [],
    );
  }

  /// `Selected Hours`
  String get SelectedHours {
    return Intl.message(
      'Selected Hours',
      name: 'SelectedHours',
      desc: '',
      args: [],
    );
  }

  /// `Hourly Rate`
  String get HourlyRate {
    return Intl.message(
      'Hourly Rate',
      name: 'HourlyRate',
      desc: '',
      args: [],
    );
  }

  /// `Registration Fees`
  String get RegistrationFees {
    return Intl.message(
      'Registration Fees',
      name: 'RegistrationFees',
      desc: '',
      args: [],
    );
  }

  /// `Total Hourly Cost`
  String get TotalHourlyCost {
    return Intl.message(
      'Total Hourly Cost',
      name: 'TotalHourlyCost',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get Total {
    return Intl.message(
      'Total',
      name: 'Total',
      desc: '',
      args: [],
    );
  }

  /// `Spending Authority`
  String get SpendingAuthority {
    return Intl.message(
      'Spending Authority',
      name: 'SpendingAuthority',
      desc: '',
      args: [],
    );
  }

  /// `Private`
  String get Private {
    return Intl.message(
      'Private',
      name: 'Private',
      desc: '',
      args: [],
    );
  }

  /// `Start at`
  String get StartAt {
    return Intl.message(
      'Start at',
      name: 'StartAt',
      desc: '',
      args: [],
    );
  }

  /// `End at`
  String get EndAt {
    return Intl.message(
      'End at',
      name: 'EndAt',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Welcomeback {
    return Intl.message(
      'Welcome',
      name: 'Welcomeback',
      desc: '',
      args: [],
    );
  }

  /// `You can complete the additional registration or withdrawal process after 8 pm Monday 01/29/2024`
  String get underRegDate {
    return Intl.message(
      'You can complete the additional registration or withdrawal process after 8 pm Monday 01/29/2024',
      name: 'underRegDate',
      desc: '',
      args: [],
    );
  }

  /// `Until 8 am the next morning`
  String get underRegDate2 {
    return Intl.message(
      'Until 8 am the next morning',
      name: 'underRegDate2',
      desc: '',
      args: [],
    );
  }

  /// `Calculate`
  String get Calculate {
    return Intl.message(
      'Calculate',
      name: 'Calculate',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `First semester 2024/2025`
  String get FirstSemester {
    return Intl.message(
      'First semester 2024/2025',
      name: 'FirstSemester',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get id {
    return Intl.message(
      'ID',
      name: 'id',
      desc: '',
      args: [],
    );
  }

  /// `0000000000`
  String get UniID {
    return Intl.message(
      '0000000000',
      name: 'UniID',
      desc: '',
      args: [],
    );
  }

  /// `Change profile picture`
  String get ChangePic {
    return Intl.message(
      'Change profile picture',
      name: 'ChangePic',
      desc: '',
      args: [],
    );
  }

  /// `Major`
  String get Major {
    return Intl.message(
      'Major',
      name: 'Major',
      desc: '',
      args: [],
    );
  }

  /// `Degree`
  String get Degree {
    return Intl.message(
      'Degree',
      name: 'Degree',
      desc: '',
      args: [],
    );
  }

  /// `Summary`
  String get Summary {
    return Intl.message(
      'Summary',
      name: 'Summary',
      desc: '',
      args: [],
    );
  }

  /// `E-learning`
  String get Elearning {
    return Intl.message(
      'E-learning',
      name: 'Elearning',
      desc: '',
      args: [],
    );
  }

  /// `Microsoft Teams`
  String get MicrosoftTeams {
    return Intl.message(
      'Microsoft Teams',
      name: 'MicrosoftTeams',
      desc: '',
      args: [],
    );
  }

  /// `Contact information`
  String get Contactinformation {
    return Intl.message(
      'Contact information',
      name: 'Contactinformation',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get ContectEmail {
    return Intl.message(
      'Email',
      name: 'ContectEmail',
      desc: '',
      args: [],
    );
  }

  /// `There is no desciplinary penalties`
  String get Thereisnodisciplinary {
    return Intl.message(
      'There is no desciplinary penalties',
      name: 'Thereisnodisciplinary',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
