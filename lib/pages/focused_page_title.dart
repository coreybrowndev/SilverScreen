class PageTitle {
  String createPageTitle(int currentTab) {
    var pageTitle = 'Silver Screen';
    if (currentTab == 0) {
      pageTitle = 'Watch Later';
    } else if (currentTab == 1) {
      pageTitle = 'What\'s new';
    } else if (currentTab == 2) {
      pageTitle = 'Silver Screen';
    } else if (currentTab == 3) {
      pageTitle = 'Favorites';
    } else {
      pageTitle = 'Silver Screen';
    }
    return pageTitle;
  }
}
