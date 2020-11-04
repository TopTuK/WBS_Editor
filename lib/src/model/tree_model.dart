class TreeNode {
  String title;
  dynamic payload;

  TreeNode _parent;
  final List<TreeNode> _childrens = List<TreeNode>();

  bool get isRoot => _parent == null;
  bool get isLeaf => _childrens.isEmpty;
  List<TreeNode> get childrens => _childrens;

  TreeNode(this.title, {this.payload});
}

class TreeService {
  final TreeNode _rootNode = TreeNode('Root Node', payload: null);

  TreeNode get rootNode => _rootNode;

  TreeService();

  void addNode(TreeNode parentNode, TreeNode node) {
    node._parent = parentNode;
    parentNode._childrens.add(node);
  }

  TreeNode addNewNode(TreeNode parentNode, String nodeTitle, {dynamic nodePayload}) {
    var node = TreeNode(nodeTitle, payload: nodePayload);
    addNode(parentNode, node);

    return node;
  }

  void removeNode(TreeNode node) {
    if(node.isRoot) {
      throw ArgumentError('Removed ${node.title} is root node');
    }
    else {
      var parentNode = node._parent;
      if(parentNode._childrens.contains(node)) node._parent._childrens.remove(node);
    }
  }

  TreeNode _findNode(TreeNode node, String title) {
    if(node.title == title) {
      return node;
    }
    else {
      TreeNode foundNode;

      for (var childNode in node._childrens) {
        foundNode = _findNode(childNode, title);
        if(foundNode != null) break;
      }

      return foundNode;
    }
  }

  TreeNode findNodeByTitle(String title) {
    return _findNode(_rootNode, title);
  }
}