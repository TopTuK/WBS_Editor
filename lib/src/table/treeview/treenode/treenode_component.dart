import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:wbs_editor/src/table/treeview/treeview_service.dart';
import '../treeview_node.dart';

@Component(
  selector: 'tree-node',
  templateUrl: 'treenode_template.html',
  styleUrls: ['treenode_styles.css'],
  directives: [coreDirectives, MaterialIconComponent, TreeNodeComponent],
)
class TreeNodeComponent implements OnInit {
  final TreeViewService _treeViewService;

  @Input('node')
  TreeViewNode currentNode;

  final List<TreeViewNode> nodeChildrens = List<TreeViewNode>();

  TreeNodeComponent(this._treeViewService);

  @override
  void ngOnInit() {
    currentNode.onChildrenChanges.listen(_udpateChildrens);
    _udpateChildrens(currentNode.node.childrens);
  }

  void _udpateChildrens(List childrens) {
    nodeChildrens.clear();
    for (var node in childrens) {
      nodeChildrens.add(TreeViewNode.fromNode(node));
    }
  }

  void expandNode(TreeViewNode node) {
    _treeViewService.expandNode(node);
  }

  void selectNode(TreeViewNode node) {
    _treeViewService.selectNode(node);
  }
}