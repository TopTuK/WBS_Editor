import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:wbs_editor/src/model/tree_model.dart';
import 'package:wbs_editor/src/table/treeview/treeview_component.dart';
import 'package:wbs_editor/src/table/treeview/treeview_node.dart';

@Component(
  selector: 'wbs-table',
  templateUrl: 'table_template.html',
  styleUrls: ['table_style.css'],
  providers: [overlayBindings],
  directives: [coreDirectives,
              MaterialButtonComponent,
              TreeViewComponent,
              AutoFocusDirective, MaterialDialogComponent, ModalComponent,],
)
class TableComponent implements OnInit {
  final TreeService _treeService;

  TableComponent(this._treeService);

  @ViewChild(TreeViewComponent)
  TreeViewComponent treeView;

  TreeViewNode rootNode;
  TreeViewNode selectedNode;

  bool showErrorRootDialog = false;
  bool showNewNodeDialog = false;
  bool showEditNodeDialog = false;

  @override
  void ngOnInit() {
    rootNode = TreeViewNode.fromNode(_treeService.rootNode);
  }

  void onSelectNode(TreeViewNode node) {
    selectedNode = node;
  }

  void addNodeClick() {
    showNewNodeDialog = true;
  }

  void addNode(String title) {
    _treeService.addNewNode(selectedNode.node, title);
    selectedNode.updateChilds();
    
    showNewNodeDialog = false;
  }

  void editNodeClick() {
    showEditNodeDialog = true;
  }

  void editNode(String title) {
    selectedNode.node.title = title;
    showEditNodeDialog = false;
  }

  void removeNodeClick() {
    if(!selectedNode.isRoot) {
      _treeService.removeNode(selectedNode.node);
      rootNode.updateChilds();
    }
    else {
      showErrorRootDialog = true;
    }
  }
}