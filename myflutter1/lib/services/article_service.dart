import '../model/dto/article_dto.dart';

import '../model/page_model.dart';
import '../utils/net/http.dart';

class AccountService {
  static Future<PageModel<ArticleDto>> articlePage(int page) async {
    var res = await HttpHelper.get("/article/list/$page/json", params: {});
    return _toArticlePage(res);
  }

  static PageModel<ArticleDto> _toArticlePage(Map<String, dynamic> res) {
    var data = res["data"];
    var list = data["datas"]
        .map<ArticleDto>((item) => ArticleDto.fromJson(item))
        .toList();
    return PageModel(data["curPage"], list, data["offset"], data["over"],
        data["pageCount"], data["size"], data["total"]);
  }
}
