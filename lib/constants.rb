module Constants
  
  CATEGORIES = {
    video: ["avi"],
    song: ["mp3"],
    document: ["odt", "docx"],
    binary: ["bin"],
    text: ["txt"]
  }

  GRAVITIES = {
    video: 1.4,
    song: 1.2,
    document: 1.1,
    binary: 1.0,
    text: 1.0,
    other: 1.0
  }

end