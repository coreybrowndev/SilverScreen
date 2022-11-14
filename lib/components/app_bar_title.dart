class AppBarTitle {
  String createAppBarTitle(int index) {
    var appBarTitle = 'Silver Screen';
    if (index == 0) {
      appBarTitle = 'Watch Later';
    } else if (index == 1) {
      appBarTitle = 'What\'s new';
    } else if (index == 2) {
      appBarTitle = 'Profile';
    } else if (index == 3) {
      appBarTitle = 'Silver Screen';
    } else {
      appBarTitle = 'Favorites';
    }
    return appBarTitle;
  }
}
