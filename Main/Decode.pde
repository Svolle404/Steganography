class decode {
  String message = "";
  String binaryMessage = "";

  void run(PImage img) {
    image(img, 0, 0);
    loadPixels();

    for (int i = 0; i < messageLength*8; i++) {
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

    for (int i = 0; i < messageLength; i++) {
      message += char(unbinary(binaryMessage.substring(i*8, i*8+8)));
    }

    println(message);
  }
}
