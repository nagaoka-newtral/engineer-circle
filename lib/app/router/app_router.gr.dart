// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AdminMenuRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminMenuPage(),
      );
    },
    AdminRootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AdminRootPage(),
      );
    },
    CreateSeatRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateSeatPage(),
      );
    },
    CreateSeatingChartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreateSeatingChartPage(),
      );
    },
    HomeTabRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeTabRouterPage(),
      );
    },
    ProfileFormRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileFormRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProfileFormPage(
          key: args.key,
          initialProfile: args.initialProfile,
          isEdit: args.isEdit,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    ProfileTabRouterRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileTabRouterPage(),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootPage(),
      );
    },
    SeatingChartRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SeatingChartPage(),
      );
    },
  };
}

/// generated route for
/// [AdminMenuPage]
class AdminMenuRoute extends PageRouteInfo<void> {
  const AdminMenuRoute({List<PageRouteInfo>? children})
      : super(
          AdminMenuRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminMenuRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AdminRootPage]
class AdminRootRoute extends PageRouteInfo<void> {
  const AdminRootRoute({List<PageRouteInfo>? children})
      : super(
          AdminRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminRootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateSeatPage]
class CreateSeatRoute extends PageRouteInfo<void> {
  const CreateSeatRoute({List<PageRouteInfo>? children})
      : super(
          CreateSeatRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateSeatRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreateSeatingChartPage]
class CreateSeatingChartRoute extends PageRouteInfo<void> {
  const CreateSeatingChartRoute({List<PageRouteInfo>? children})
      : super(
          CreateSeatingChartRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateSeatingChartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeTabRouterPage]
class HomeTabRouterRoute extends PageRouteInfo<void> {
  const HomeTabRouterRoute({List<PageRouteInfo>? children})
      : super(
          HomeTabRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeTabRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileFormPage]
class ProfileFormRoute extends PageRouteInfo<ProfileFormRouteArgs> {
  ProfileFormRoute({
    Key? key,
    required User? initialProfile,
    required bool isEdit,
    List<PageRouteInfo>? children,
  }) : super(
          ProfileFormRoute.name,
          args: ProfileFormRouteArgs(
            key: key,
            initialProfile: initialProfile,
            isEdit: isEdit,
          ),
          initialChildren: children,
        );

  static const String name = 'ProfileFormRoute';

  static const PageInfo<ProfileFormRouteArgs> page =
      PageInfo<ProfileFormRouteArgs>(name);
}

class ProfileFormRouteArgs {
  const ProfileFormRouteArgs({
    this.key,
    required this.initialProfile,
    required this.isEdit,
  });

  final Key? key;

  final User? initialProfile;

  final bool isEdit;

  @override
  String toString() {
    return 'ProfileFormRouteArgs{key: $key, initialProfile: $initialProfile, isEdit: $isEdit}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileTabRouterPage]
class ProfileTabRouterRoute extends PageRouteInfo<void> {
  const ProfileTabRouterRoute({List<PageRouteInfo>? children})
      : super(
          ProfileTabRouterRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileTabRouterRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RootPage]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SeatingChartPage]
class SeatingChartRoute extends PageRouteInfo<void> {
  const SeatingChartRoute({List<PageRouteInfo>? children})
      : super(
          SeatingChartRoute.name,
          initialChildren: children,
        );

  static const String name = 'SeatingChartRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
