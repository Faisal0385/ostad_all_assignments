// There is a base class called Media
class Media {
  // a method called play()
  void play() {
    print("Playing media...");
  }
}

// You need to create a derived class called Song
// that inherits from the Media class
class Song extends Media {

  // adds an additional attribute called artist (string).
  String artist;

  // constructor
  Song(this.artist);

  @override
  void play() {
    print('Playing song by $artist...');
  }
}


void main() {
  // In main() create one instance of Media and one of Song.
  Media mediaObj = Media();
  Song songObj = Song("Kaifi Khalil");

  // Call their play() methods that print proper messages.
  mediaObj.play();
  songObj.play();
}