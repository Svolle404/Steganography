String message;
int messageLength;
PImage img;

encode encode;
decode decode;

void setup() {
  message = "Her kan man skrive den hemmelige besked som man gerne vil skjule i billedets data.";
  messageLength = message.length();
  img = loadImage("/outputs/Encoded image 974201.png");

  size(100, 100);
  surface.setResizable(true);
  surface.setSize(img.width, img.height);

  encode = new encode();
  decode = new decode();
}

void draw() {
  encode.run(img, message);
  decode.run(img);
  exit();
}

//println(char(unbinary("00101110")));
//println(binary(char('.'), bits));
//exit();

// Skriv besked i string.
// Lav besked om til 1'er og 0'er.
// Load array med pixels fra et billede.
// I en dobbelt for-løkke ændres de to sidste bits for hver farve (R, G og B) i hvert pixel.
// Arrayet med pixels gemmes som nyt billede.
