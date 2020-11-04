import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:wbs_editor/src/mainmenu/main_menu_component.dart';
import 'package:wbs_editor/src/model/tree_model.dart';
import 'src/routes/routes.dart';

@Component(
  selector: 'wbs-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [routerDirectives, MainMenuComponent],
  providers: [ClassProvider(TreeService)],
  exports: [RoutePaths, Routes],
)
class AppComponent {

}
