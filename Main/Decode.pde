class decode {
  String decodedMessage = "";
  String binaryMessage = "";

  void run(PImage img) {
    println("Loading image...");
    image(img, 0, 0);
    loadPixels();

    println("Retrieving binary from image data...");
    for (int i = 0; i < message.length()*8/3; i++) {
      color c = pixels[i];
      int r = int(red(c));
      int g = int(green(c));
      int b = int(blue(c));

      String rBinary = binary(r, 8);
      binaryMessage += rBinary.charAt(7);

      String gBinary = binary(g, 8);
      binaryMessage += gBinary.charAt(7);

      String bBinary = binary(b, 8);
      binaryMessage += bBinary.charAt(7);
    }

    println("Converting binary to characters...");
    for (int i = 0; i < binaryMessage.length()/8; i++) {
      decodedMessage += char(unbinary(binaryMessage.substring(i*8, i*8+8)));
    }

    println("Saving decoded message as a text file...");
    String[] temp = new String[1];
    temp[0] = decodedMessage;
    saveStrings("/outputs/Decoded message.txt", temp);

    println("Decoding done!");
  }
}
