abstract class Newsstates {}

class NewsInitialState extends Newsstates {}

class ChangeNavBarState extends Newsstates {}

class NewsGetBusinessSuccessState extends Newsstates {}

class NewsGetBusinessErrorState extends Newsstates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetBusinessLodingState extends Newsstates {}

class NewsGetSportsSuccessState extends Newsstates {}

class NewsGetSportsErrorState extends Newsstates {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetSportsLodingState extends Newsstates {}

class NewsGetScienceSuccessState extends Newsstates {}

class NewsGetScienceErrorState extends Newsstates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetScienceLodingState extends Newsstates {}

class NewsChangeAppThemeState extends Newsstates {}

class NewsGetSearchSuccessState extends Newsstates {}

class NewsGetSearchErrorState extends Newsstates {
  final String error;

  NewsGetSearchErrorState(this.error);
}

class NewsGetSearchLodingState extends Newsstates {}
