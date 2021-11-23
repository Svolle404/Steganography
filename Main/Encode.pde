class encode {
  String binaryMessage = "";

  void run(PImage img, String message) {
    println("Converting message to binary...");
    for (int i = 0; i < message.length(); i++) {
      binaryMessage += binary(message.charAt(i), 8);
    }

    println("Adjusting for missing bits...");
    while (binaryMessage.length() % 3 != 0) {
      binaryMessage += "1";
    }

    int n = binaryMessage.length()/3;
    n = constrain(n, 0, img.width*img.height);

    println("Loading image...");
    image(img, 0, 0);
    loadPixels();

    println("Adding binary message to image data...");
    for (int i = 0; i < n; i++) {
      color c = pixels[i];
      int r = int(red(c));
      int g = int(green(c));
      int b = int(blue(c));

      String rBinary = binary(r, 8);
      rBinary = rBinary.substring(0, 7)+binaryMessage.charAt(0+i*3);

      String gBinary = binary(g, 8);
      gBinary = gBinary.substring(0, 7)+binaryMessage.charAt(1+i*3);

      String bBinary = binary(b, 8);
      bBinary = bBinary.substring(0, 7)+binaryMessage.charAt(2+i*3);

      c = color(unbinary(rBinary), unbinary(gBinary), unbinary(bBinary));
      pixels[i] = c;
    }

    println("Saving new image...");
    updatePixels();  
    save("/outputs/Encoded image.png");

    println("Encoding done!");
  }
}
