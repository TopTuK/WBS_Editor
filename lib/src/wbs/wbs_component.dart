import 'package:angular/angular.dart';
import 'package:wbs_editor/src/model/tree_model.dart';

// LINKS
// 1. https://www.cssscript.com/semantic-hierarchy-tree-treeflex/
// 2. https://www.cssscript.com/clean-tree-diagram/
// 3. https://thecodeplayer.com/index.php/walkthrough/css3-family-tree

@Component(
  selector: 'wbs-tree',
  templateUrl: 'wbs_template.html',
  styleUrls: ['wbs_styles.css', 'wbs_node.css'],
)
class WbsComponent implements OnInit {
  final TreeService _treeService;

  TreeNode rootNode;

  WbsComponent(this._treeService);

  String treeHtml;

  void _buildHtmlTree(StringBuffer html, TreeNode node) {
    html.write('<li>');

    html.write('<span class="tf-nc">${node.title}</span>');
    if(!node.isLeaf) {
      html.write('<ul>');

      for (var childNode in node.childrens) {
        _buildHtmlTree(html, childNode);
      }

      html.write('</ul>');
    }
    
    html.write('</li>');
  }

  @override
  void ngOnInit() {
    rootNode = _treeService.rootNode;

    var html = StringBuffer();
    
    html.write('<ul>');
    _buildHtmlTree(html, rootNode);
    html.write('</ul>');

    treeHtml = html.toString();
  }
}