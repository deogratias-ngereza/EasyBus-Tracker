import 'package:easy_bus_tracker/routes.dart';
import 'package:easy_bus_tracker/screens/admin/AdminPage.dart';
import 'package:easy_bus_tracker/screens/admin_buses/AdmBusesPage.dart';
import 'package:easy_bus_tracker/screens/bus_routes/BusRoutePage.dart';
import 'package:easy_bus_tracker/screens/dashboard/DashboardPage.dart';
import 'package:easy_bus_tracker/screens/login/LoginPage.dart';
import 'package:easy_bus_tracker/screens/route_map_buses/RouteMapBusesPage.dart';
import 'package:easy_bus_tracker/screens/splash/SplashPage.dart';
import 'package:get/get.dart';


List<GetPage> getPages = [
  GetPage(
    name:Routes.login_route,
    page: () => LoginPage()
  ),

  GetPage(
      name:Routes.dashboard_route,
      page: () => DashboardPage()
  ),
  GetPage(
      name:Routes.splash_route,
      page: () => SplashPage()
  ),

  GetPage(
      name:Routes.bus_routes_route,
      page: () => BusRoutePage()
  ),

  GetPage(
      name:Routes.route_map_buses_route,
      page: () => RouteMapBusesPage()
  ),


  GetPage(
      name:Routes.admin_page_route,
      page: () => AdminPage()
  ),
  GetPage(
      name:Routes.admin_buses_route,
      page: () => AdmBusesPage()
  ),


  /*GetPage(
      name:Routes.profile_edit,
      page: () => ProfileEditPage()
  ),
  GetPage(
      name:Routes.change_password,
      page: () => ChangePasswordPage()
  ),*/


];
