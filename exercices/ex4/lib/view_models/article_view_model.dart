// view model to deal with the state of the list of articles
import 'package:flutter/cupertino.dart';

import '../models/article.dart';

class ArticleViewModel extends ChangeNotifier {
  bool _showRead = false;
  final List<Article> _articles = <Article>[];

  bool get showRead => _showRead;

  List<Article> get articles => _articles;

  void toggleShowRead() {
    _showRead = !_showRead;
    notifyListeners();
  }

  Article? getArticleById(int id) {
    return _articles.firstWhere((article) => article.id == id);
  }

  void addArticle(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  void deleteArticle(Article article) {
    _articles.remove(article);
    notifyListeners();
  }

  void toggleRead(Article article) {
    article.read = !article.read;
    notifyListeners();
  }
}
