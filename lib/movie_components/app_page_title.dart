class PageTitle {
  String createPageTitle(int currentTab) {
    var pageTitle = 'Silver Screen';
    if (currentTab == 0) {
      pageTitle = 'Watch Later';
    } else if (currentTab == 1) {
      pageTitle = 'What\'s new';
    } else if (currentTab == 2) {
      pageTitle = 'Profile';
    } else if (currentTab == 3) {
      pageTitle = 'Silver Screen';
    } else {
      pageTitle = 'Favorites';
    }
    return pageTitle;
  }
}
