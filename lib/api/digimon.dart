class Digimon {
  Digimon({
    required this.content,
    required this.pageable,
  });
  late final List<Content> content;
  late final Pageable pageable;

  Digimon.fromJson(Map<String, dynamic> json) {
    content =
        List.from(json['content']).map((e) => Content.fromJson(e)).toList();
    pageable = Pageable.fromJson(json['pageable']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['content'] = content.map((e) => e.toJson()).toList();
    _data['pageable'] = pageable.toJson();
    return _data;
  }
}

class Content {
  Content({
    required this.id,
    required this.name,
    required this.href,
  });
  late final int id;
  late final String name;
  late final String href;

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['href'] = href;
    return _data;
  }
}

class Pageable {
  Pageable({
    required this.currentPage,
    required this.elementsOnPage,
    required this.totalElements,
    required this.totalPages,
    required this.previousPage,
    required this.nextPage,
  });
  late final int currentPage;
  late final int elementsOnPage;
  late final int totalElements;
  late final int totalPages;
  late final String previousPage;
  late final String nextPage;

  Pageable.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    elementsOnPage = json['elementsOnPage'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    previousPage = json['previousPage'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentPage'] = currentPage;
    _data['elementsOnPage'] = elementsOnPage;
    _data['totalElements'] = totalElements;
    _data['totalPages'] = totalPages;
    _data['previousPage'] = previousPage;
    _data['nextPage'] = nextPage;
    return _data;
  }
}
