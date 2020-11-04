import 'dart:async';
import 'package:wbs_editor/src/table/treeview/treeview_node.dart';

class TreeViewService {
  final StreamController<TreeViewNode> _selectNodeController = StreamController<TreeViewNode>();

  Stream<TreeViewNode> get onSelectNode => _selectNodeController.stream;

  TreeViewNode _selectedNode;
  TreeViewNode get selectedNode => _selectedNode;

  void expandNode(TreeViewNode node) {
    node.isExpanded = !node.isExpanded;
    selectNode(node);
  }

  void selectNode(TreeViewNode node) {
    if(_selectedNode == null) {
      _selectedNode = node;
      node.isSelected = true;
    }
    else {
      if(node == _selectedNode) {
        node.isSelected = false;
        _selectedNode = null;
      }
      else {
        _selectedNode.isSelected = false;
        node.isSelected = true;
        _selectedNode = node;
      }
    }

    _selectNodeController.add(_selectedNode);
  }
}