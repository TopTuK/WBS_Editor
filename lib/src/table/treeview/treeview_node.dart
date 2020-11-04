import 'dart:async';

import 'package:wbs_editor/src/model/tree_model.dart';

class TreeViewNode {
  final TreeNode _node;

  TreeNode get node => _node;
  String get title => _node.title;
  bool get isRoot => _node.isRoot;
  bool get isLeaf => _node.isLeaf;

  bool isExpanded = true;
  bool isSelected = false;

  final StreamController<List<TreeNode>> _childsController = StreamController<List<TreeNode>>();
  Stream<List<TreeNode>> get onChildrenChanges => _childsController.stream;

  TreeViewNode._(this._node);

  void updateChilds() {
    _childsController.add(_node.childrens);
  }

  factory TreeViewNode.fromNode(TreeNode node) => TreeViewNode._(node);
}