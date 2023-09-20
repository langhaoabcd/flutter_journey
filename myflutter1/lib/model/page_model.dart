class PageModel<T> {
  final int curPage;
  final List<T> datas;
  final int offset;
  final bool over;
  final int pageCount;
  final int size;
  final int total;

  PageModel(this.curPage, this.datas, this.offset, this.over, this.pageCount,
      this.size, this.total);
}
