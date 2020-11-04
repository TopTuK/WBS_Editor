import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import '../routes/routes.dart';

@Component(
  selector: 'main-menu',
  templateUrl: 'main_menu.html',
  styleUrls: ['main_menu.css'],
  directives: [routerDirectives],
  exports: [RoutePaths, Routes],
)
class MainMenuComponent {

}