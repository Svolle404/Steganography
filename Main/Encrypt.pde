class encrypt {
  String binaryMessage = "";
  
  void run(String message, PImage img) {
    for (int i = 0; i < message.length(); i++) {
      binaryMessage += binary(message.charAt(i), 8);
    }
  }
}
