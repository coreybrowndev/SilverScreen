class PageTitle {
  //Each number that index refers to is the current tab
  String createPageTitle(int index) {
    var pageTitle = 'Silver Screen';
    if (index == 0) {
      pageTitle = 'Watch Later';
    } else if (index == 1) {
      pageTitle = 'What\'s new';
    } else if (index == 2) {
      pageTitle = 'Profile';
    } else if (index == 3) {
      pageTitle = 'Silver Screen';
    } else {
      pageTitle = 'Favorites';
    }
    return pageTitle;
  }
}
