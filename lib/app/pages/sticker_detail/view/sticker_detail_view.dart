abstract interface class StickerDetailView {
  void screenLoader(bool hasSticker, String countryCode, String stickerNumber,
      String countryName, int amount);

  void updateAmount(int amount);

  void showLoader();

  void saveSucess();

  void error(String message);
}
