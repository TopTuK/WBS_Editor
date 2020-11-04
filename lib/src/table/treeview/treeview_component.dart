import 'dart:async';
import 'package:angular/angular.dart';
import 'package:wbs_editor/src/table/treeview/treenode/treenode_component.dart';
import 'package:wbs_editor/src/table/treeview/treeview_node.dart';
import 'package:wbs_editor/src/table/treeview/treeview_service.dart';

@Component(
  selector: 'tree-view',
  templateUrl: 'treeview_template.html',
  styleUrls: ['treeview_styles.css'],
  directives: [TreeNodeComponent],
  providers: [ClassProvider(TreeViewService)]
)
class TreeViewComponent implements OnInit {
  final TreeViewService _treeViewService;

  @Input('root-node')
  TreeViewNode rootNode;

  final StreamController<TreeViewNode> _selectedNodeController = StreamController<TreeViewNode>();
  @Output('select-node')
  Stream<TreeViewNode> get selectNode => _selectedNodeController.stream;

  TreeViewComponent(this._treeViewService);

  @override
  void ngOnInit() {
    _treeViewService.onSelectNode.listen(onNodeSelected);
  }

  void onNodeSelected(TreeViewNode node) {
    _selectedNodeController.add(node);
  }
}