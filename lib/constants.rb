module Constants
  
  CATEGORIES = {
    video: ["avi"],
    song: ["mp3"],
    document: ["odt", "docx"],
    binary: ["bin"],
    text: ["txt"]
  }

  GRAVITIES = {
    video: 1.40,
    song: 1.20,
    document: 1.10,
    binary: 1.00,
    text: 1.00,
    other: 1.00
  }

end