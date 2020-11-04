import 'package:angular_router/angular_router.dart';
import 'route_paths.dart';

import '../home/home_component.template.dart' as home_template;
import '../table/table_component.template.dart' as table_template;
import '../wbs/wbs_component.template.dart' as wbs_template;
import '../about/about_component.template.dart' as about_template;

export 'route_paths.dart';

class Routes {
  static final RouteDefinition home = new RouteDefinition(
    routePath: RoutePaths.home,
    component: home_template.HomeComponentNgFactory,
    useAsDefault: true,
  );

  static final RouteDefinition table = new RouteDefinition(
    routePath: RoutePaths.table,
    component: table_template.TableComponentNgFactory,
  );

  static final RouteDefinition wbs = new RouteDefinition(
    routePath: RoutePaths.wbs,
    component: wbs_template.WbsComponentNgFactory,
  );

  static final RouteDefinition about = new RouteDefinition(
    routePath: RoutePaths.about,
    component: about_template.AboutComponentNgFactory,
  );

  static final all = <RouteDefinition>[
    home,
    table,
    wbs,
    about,
  ];
}