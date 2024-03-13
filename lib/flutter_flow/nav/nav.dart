import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.loggedIn
          ? HomeNewWidget()
          : RegistrationCOPYWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? HomeNewWidget()
              : RegistrationCOPYWidget(),
          routes: [
            FFRoute(
              name: 'HomePageOld',
              path: 'homePageOld',
              requireAuth: true,
              builder: (context, params) => HomePageOldWidget(),
            ),
            FFRoute(
              name: 'loginAdmin',
              path: 'loginAdmin',
              builder: (context, params) => LoginAdminWidget(),
            ),
            FFRoute(
              name: 'signupAdmin',
              path: 'signupAdmin',
              builder: (context, params) => SignupAdminWidget(),
            ),
            FFRoute(
              name: 'ScheduleOld',
              path: 'scheduleOld',
              requireAuth: true,
              builder: (context, params) => ScheduleOldWidget(),
            ),
            FFRoute(
              name: 'EventPage',
              path: 'eventPage',
              requireAuth: true,
              builder: (context, params) => EventPageWidget(),
            ),
            FFRoute(
              name: 'registerAttendees',
              path: 'registerAttendees',
              requireAuth: true,
              builder: (context, params) => RegisterAttendeesWidget(),
            ),
            FFRoute(
              name: 'EventTicket',
              path: 'eventTicket',
              requireAuth: true,
              builder: (context, params) => EventTicketWidget(),
            ),
            FFRoute(
              name: 'createEventform',
              path: 'createEventform',
              requireAuth: true,
              builder: (context, params) => CreateEventformWidget(),
            ),
            FFRoute(
              name: 'createPastEvent',
              path: 'createPastEvent',
              requireAuth: true,
              builder: (context, params) => CreatePastEventWidget(),
            ),
            FFRoute(
              name: 'createSpeakerProfile',
              path: 'createSpeakerProfile',
              requireAuth: true,
              builder: (context, params) => CreateSpeakerProfileWidget(),
            ),
            FFRoute(
              name: 'CreateBreakoutRooms',
              path: 'createBreakoutRooms',
              requireAuth: true,
              builder: (context, params) => CreateBreakoutRoomsWidget(),
            ),
            FFRoute(
              name: 'StreamEvent',
              path: 'streamEvent',
              requireAuth: true,
              builder: (context, params) => StreamEventWidget(),
            ),
            FFRoute(
              name: 'loginAtt',
              path: 'loginAtt',
              builder: (context, params) => LoginAttWidget(),
            ),
            FFRoute(
              name: 'BreakoutRooms',
              path: 'breakoutRooms',
              requireAuth: true,
              builder: (context, params) => BreakoutRoomsWidget(),
            ),
            FFRoute(
              name: 'signupAtt',
              path: 'signupAtt',
              builder: (context, params) => SignupAttWidget(),
            ),
            FFRoute(
              name: 'quemanagement',
              path: 'quemanagement',
              requireAuth: true,
              builder: (context, params) => QuemanagementWidget(),
            ),
            FFRoute(
              name: 'Program',
              path: 'program',
              requireAuth: true,
              builder: (context, params) => ProgramWidget(),
            ),
            FFRoute(
              name: 'People',
              path: 'people',
              requireAuth: true,
              builder: (context, params) => PeopleWidget(
                unselected: params.getParam('unselected', ParamType.Color),
              ),
            ),
            FFRoute(
              name: 'UserBio',
              path: 'userBio',
              requireAuth: true,
              builder: (context, params) => UserBioWidget(),
            ),
            FFRoute(
              name: 'UserBioCopy',
              path: 'userBioCopy',
              requireAuth: true,
              builder: (context, params) => UserBioCopyWidget(),
            ),
            FFRoute(
              name: 'SpeakerProfile',
              path: 'speakerProfile',
              requireAuth: true,
              builder: (context, params) => SpeakerProfileWidget(),
            ),
            FFRoute(
              name: 'Speakers',
              path: 'speakers',
              requireAuth: true,
              builder: (context, params) => SpeakersWidget(
                unselected: params.getParam('unselected', ParamType.Color),
                bgColor: params.getParam('bgColor', ParamType.Color),
              ),
            ),
            FFRoute(
              name: 'Sponsors',
              path: 'sponsors',
              requireAuth: true,
              builder: (context, params) => SponsorsWidget(),
            ),
            FFRoute(
              name: 'HomeNew',
              path: 'homeNew',
              requireAuth: true,
              builder: (context, params) => HomeNewWidget(),
            ),
            FFRoute(
              name: 'MainRegistration-login',
              path: 'mainRegistrationLogin',
              builder: (context, params) => MainRegistrationLoginWidget(),
            ),
            FFRoute(
              name: 'Miventu-Registration',
              path: 'miventuRegistration',
              builder: (context, params) => MiventuRegistrationWidget(),
            ),
            FFRoute(
              name: 'Profileitems',
              path: 'profileitems',
              requireAuth: true,
              builder: (context, params) => ProfileitemsWidget(),
            ),
            FFRoute(
              name: 'Welcome',
              path: 'welcome/',
              requireAuth: true,
              builder: (context, params) => WelcomeWidget(),
            ),
            FFRoute(
              name: 'Availability',
              path: 'availability',
              requireAuth: true,
              builder: (context, params) => AvailabilityWidget(),
            ),
            FFRoute(
              name: 'Interests',
              path: 'interests',
              requireAuth: true,
              builder: (context, params) => InterestsWidget(),
            ),
            FFRoute(
              name: 'Profile',
              path: 'profile',
              requireAuth: true,
              builder: (context, params) => ProfileWidget(),
            ),
            FFRoute(
              name: 'RegistrationCOPY',
              path: 'registrationCOPY',
              builder: (context, params) => RegistrationCOPYWidget(),
            ),
            FFRoute(
              name: 'useraccountprofile',
              path: 'useraccountprofile',
              requireAuth: true,
              builder: (context, params) => UseraccountprofileWidget(),
            ),
            FFRoute(
              name: 'UserAccountSettings',
              path: 'userAccountSettings',
              requireAuth: true,
              builder: (context, params) => UserAccountSettingsWidget(),
            ),
            FFRoute(
              name: 'tabs',
              path: 'tabs',
              requireAuth: true,
              builder: (context, params) => TabsWidget(),
            ),
            FFRoute(
              name: 'template',
              path: 'template',
              requireAuth: true,
              builder: (context, params) => TemplateWidget(),
            ),
            FFRoute(
              name: 'templateCopy',
              path: 'templateCopy',
              requireAuth: true,
              builder: (context, params) => TemplateCopyWidget(),
            ),
            FFRoute(
              name: 'test',
              path: 'test',
              requireAuth: true,
              builder: (context, params) => TestWidget(),
            ),
            FFRoute(
              name: 'BreakoutRoomsMobile',
              path: 'breakoutRoomsMobile',
              requireAuth: true,
              builder: (context, params) => BreakoutRoomsMobileWidget(),
            ),
            FFRoute(
              name: 'HomeMobile',
              path: 'homeMobile',
              requireAuth: true,
              builder: (context, params) => HomeMobileWidget(),
            ),
            FFRoute(
              name: 'PeopleMobile',
              path: 'peopleMobile',
              requireAuth: true,
              builder: (context, params) => PeopleMobileWidget(),
            ),
            FFRoute(
              name: 'ProgramMobile',
              path: 'programMobile',
              requireAuth: true,
              builder: (context, params) => ProgramMobileWidget(),
            ),
            FFRoute(
              name: 'SpeakerProfileMobile',
              path: 'speakerProfileMobile',
              requireAuth: true,
              builder: (context, params) => SpeakerProfileMobileWidget(),
            ),
            FFRoute(
              name: 'SpeakersMobile',
              path: 'speakersMobile',
              requireAuth: true,
              builder: (context, params) => SpeakersMobileWidget(),
            ),
            FFRoute(
              name: 'SponsorsMobile',
              path: 'sponsorsMobile',
              requireAuth: true,
              builder: (context, params) => SponsorsMobileWidget(),
            ),
            FFRoute(
              name: 'StreamEventMobile',
              path: 'streamEventMobile',
              requireAuth: true,
              builder: (context, params) => StreamEventMobileWidget(),
            ),
            FFRoute(
              name: 'UserAccountMobile',
              path: 'userAccountMobile',
              requireAuth: true,
              builder: (context, params) => UserAccountMobileWidget(),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/registrationCOPY';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/Loading_icon.gif',
                      width: 500.0,
                      height: 400.0,
                      fit: BoxFit.none,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
