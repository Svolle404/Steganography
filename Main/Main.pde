encrypt encrypt;
decrypt decrypt;

void setup() {
  String message = "Hej Quynh. Jeg elsker dig rigtig, rigtig meget.";
  PImage img = loadImage("/");
  
  encrypt = new encrypt();
  decrypt = new decrypt();
  
  encrypt.run(message, img);
}

//println(char(unbinary("00101110")));
//println(binary(char('.'), bits));
//exit();

// Skriv besked i string.
// Lav besked om til 1'er og 0'er.
// Load array med pixels fra et billede.
// I en dobbelt for-løkke ændres de to sidste bits for hver farve (R, G og B) i hvert pixel.
// Arrayet med pixels gemmes som nyt billede.
