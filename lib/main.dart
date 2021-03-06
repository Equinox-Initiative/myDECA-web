import 'package:firebase/firebase.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mydeca_web/beta_page.dart';
import 'package:mydeca_web/pages/auth/login_page.dart';
import 'package:mydeca_web/pages/auth/register_advisor_page.dart';
import 'package:mydeca_web/pages/auth/register_page.dart';
import 'package:mydeca_web/pages/conference/conference_details_page.dart';
import 'package:mydeca_web/pages/conference/conference_page.dart';
import 'package:mydeca_web/pages/conference/mock/judging/mock_conference_roleplay_judging.dart';
import 'package:mydeca_web/pages/conference/mock/judging/mock_conference_written_judging.dart';
import 'package:mydeca_web/pages/conference/mock/mock_conference_roleplay_page.dart';
import 'package:mydeca_web/pages/conference/mock/mock_conference_testing_page.dart';
import 'package:mydeca_web/pages/conference/mock/mock_conference_written_page.dart';
import 'package:mydeca_web/pages/event/event_details_page.dart';
import 'package:mydeca_web/pages/event/events_page.dart';
import 'package:mydeca_web/pages/home/advisor/manage_user_page.dart';
import 'package:mydeca_web/pages/home/announcement/announcement_details_page.dart';
import 'package:mydeca_web/pages/home/announcement/announcements_page.dart';
import 'package:mydeca_web/pages/home/announcement/new_announcement_page.dart';
import 'package:mydeca_web/pages/home/handbook/handbook_page.dart';
import 'package:mydeca_web/pages/home/handbook/manage_handbook_page.dart';
import 'package:mydeca_web/pages/home/home_page.dart';
import 'package:mydeca_web/pages/home/meeting/meeting_details_page.dart';
import 'package:mydeca_web/pages/home/meeting/meeting_page.dart';
import 'package:mydeca_web/pages/home/meeting/new_meeting_page.dart';
import 'package:mydeca_web/pages/onboarding_page.dart';
import 'package:mydeca_web/pages/settings/settings_about_page.dart';
import 'package:mydeca_web/pages/settings/settings_page.dart';
import 'package:mydeca_web/utils/service_account.dart';
import 'package:mydeca_web/utils/theme.dart';
import 'utils/config.dart';

void main() {
  initializeApp(
      apiKey: ServiceAccount.apiKey,
      authDomain: ServiceAccount.authDomain,
      databaseURL: ServiceAccount.databaseUrl,
      projectId: ServiceAccount.projectID,
      storageBucket: ServiceAccount.storageUrl
  );

  // BETA ROUTE
  router.define('/beta', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new BetaPage();
  }));

  // AUTH ROUTES
  router.define('/login', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new LoginPage();
  }));
  router.define('/register', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new RegisterPage();
  }));
  router.define('/register/advisor', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new RegisterAdvisorPage();
  }));

  // HOME ROUTES
  router.define('/', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new OnboardingPage();
  }));
  router.define('/home', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HomePage();
  }));
  router.define('/home/manage-users', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ManageUserPage() ;
  }));

  // HANDBOOK ROUTES
  router.define('/home/handbook', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new HandbookPage();
  }));
  router.define('/home/handbook/manage', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ManageHandbookPage();
  }));

  // ANNOUNCEMENT ROUTES
  router.define('/home/announcements', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new AnnouncementsPage();
  }));
  router.define('/home/announcements/details', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new AnnouncementDetailsPage();
  }));
  router.define('/home/announcements/new', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new NewAnnouncementPage();
  }));

  // MEETING ROUTES
  router.define('/home/meetings', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MeetingPage();
  }));
  router.define('/home/meetings/details', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MeetingDetailsPage();
  }));
  router.define('/home/meetings/new', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new NewMeetingPage();
  }));

  // CONFERENCES ROUTES
  router.define('/conferences', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ConferencesPage();
  }));
  router.define('/conferences/:id', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new ConferenceDetailsPage(params["id"][0]);
  }));
  router.define('/conferences/:id/testing', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MockConferenceTestingPage(params["id"][0]);
  }));
  router.define('/conferences/:id/written', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MockConferenceWrittenPage(params["id"][0]);
  }));
  router.define('/conferences/:id/written/:tid/judging', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MockConferenceWrittenJudgingPage(params["id"][0], params["tid"][0]);
  }));
  router.define('/conferences/:id/roleplay', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MockConferenceRoleplayPage(params["id"][0]);
  }));
  router.define('/conferences/:id/roleplay/:tid/judging', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new MockConferenceRoleplayJudgingPage(params["id"][0], params["tid"][0]);
  }));


  // EVENTS ROUTES
  router.define('/events', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new EventsPage();
  }));
  router.define('/events/details', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new EventDetailsPage();
  }));

  // CHAT ROUTES
  router.define('/chat', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new Container();
  }));

  // SETTINGS ROUTES
  router.define('/settings', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new SettingsPage();
  }));
  router.define('/settings/about', handler: new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return new SettingsAboutPage();
  }));

  runApp(new MaterialApp(
    title: "myDECA",
    debugShowCheckedModeBanner: false,
    theme: mainTheme,
    initialRoute: '/',
    onGenerateRoute: router.generator,
  ));
}