import 'package:egyptopia/features/z/question_model.dart';

class QuizData {
  static final Map<String, List<Question>> questionsByLevel = {
    "beginner": [
      Question(
          question: "What is the capital of Egypt?",
          options: ["Alexandria", "Luxor", "Cairo", "Aswan"],
          correctIndex: 2,
          imagePath: 'assets/images/b1.jpeg'),
      Question(
          question: "Which famous river runs through Egypt?",
          options: ["Amazon", "Nile", "Ganges", "Mississippi"],
          correctIndex: 1,
          imagePath: 'assets/images/b2.jpeg'),
      Question(
          question: "What is the name of the ancient Egyptian writing system?",
          options: ["Cuneiform", "Latin", "Hieroglyphics", "Sanskrit"],
          correctIndex: 2,
          imagePath: 'assets/images/b3.jpeg'),
      Question(
          question:
              "Which iconic structure is one of the Seven Wonders of the Ancient World?",
          options: [
            "The Great Pyramid",
            "Colosseum",
            "Eiffel Tower",
            "Big Ben"
          ],
          correctIndex: 0,
          imagePath: 'assets/images/b4.jpeg'),
      Question(
          question: "Which desert covers most of Egypt?",
          options: ["Gobi", "Sahara", "Atacama", "Mojave"],
          correctIndex: 1,
          imagePath: 'assets/images/b5.jpeg'),
      Question(
          question:
              "Which city is famous for its ancient temples and the Valley of the Kings?",
          options: ["Luxor", "Sharm El-Sheikh", "Alexandria", "Hurghada"],
          correctIndex: 0,
          imagePath: 'assets/images/b6.jpeg'),
      Question(
          question:
              "What is the name of the famous stone that helped decode hieroglyphics?",
          options: [
            "Rosetta Stone",
            "Black Stone",
            "Philosopher's Stone",
            "Alabaster Stone"
          ],
          correctIndex: 0,
          imagePath: 'assets/images/b7.png'),
      Question(
          question: "Which sea borders Egypt to the north?",
          options: [
            "Red Sea",
            "Mediterranean Sea",
            "Arabian Sea",
            "Caspian Sea"
          ],
          correctIndex: 1,
          imagePath: 'assets/images/b8.jpeg'),
      Question(
          question:
              "What is the name of the famous Sphinx near the Pyramids of Giza?",
          options: [
            "The Grand Sphinx",
            "The Egyptian Lion",
            "The Great Sphinx Of Giza",
            "The Guardian Sphinx"
          ],
          correctIndex: 2,
          imagePath: 'assets/images/b9.jpeg'),
      Question(
          question:
              "Which ancient queen ruled Egypt and had a famous relationship with Julius Caesar?",
          options: ["Nefertiti", "Hatshepsut", "Cleopatra VII", "Isis"],
          correctIndex: 2,
          imagePath: 'assets/images/b10.jpeg'),
    ],
    "intermediate": [
      Question(
          question: "What was the purpose of the pyramids in ancient Egypt?",
          options: [
            "Palaces",
            "Tombs for pharaohs",
            "Temples",
            "Storage facilities"
          ],
          correctIndex: 1,
          imagePath: 'assets/images/i1.jpeg'),
      Question(
          question: "Which famous mosque is located in Cairo’s Citadel?",
          options: [
            "Sultan Hassan Mosque",
            "Ibn Tulun Mosque",
            "Al-Azhar Mosque",
            "Mosque of Muhammad Ali"
          ],
          correctIndex: 3,
          imagePath: 'assets/images/i2.jpg'),
      Question(
          question:
              "Which Egyptian city is known as the 'Pearl of the Mediterranean'?",
          options: ["Alexandria", "Port Said", "Hurghada", "Ismailia"],
          correctIndex: 0,
          imagePath: 'assets/images/i3.jpeg'),
      Question(
          question:
              "Who built the first pyramid in Egypt, known as the Step Pyramid?",
          options: ["Tutankhamun", "Ramses II", "Sneferu", "Imhotep"],
          correctIndex: 3,
          imagePath: 'assets/images/i4.jpeg'),
      Question(
          question:
              "Which Egyptian god is associated with mummification and the afterlife?",
          options: ["Osiris", "Horus", "Anubis", "Ra"],
          correctIndex: 2,
          imagePath: 'assets/images/i5.jpeg'),
      Question(
          question:
              "Which ancient Egyptian pharaoh is known for his nearly intact tomb discovered in 1922?",
          options: ["Ramses II", "Akhenaten", "Tutankhamun", "Thutmose III"],
          correctIndex: 2,
          imagePath: 'assets/images/i6.jpeg'),
      Question(
          question:
              "Which famous Egyptian market is one of the oldest in the Middle East?",
          options: [
            "Khan El Khalili",
            "Souq Waqif",
            "Grand Bazaar",
            "Attaba Market"
          ],
          correctIndex: 0,
          imagePath: 'assets/images/i7.jpeg'),
      Question(
          question: "Which modern city is built on the ancient city of Thebes?",
          options: ["Aswan", "Cairo", "Luxor", "Edfu"],
          correctIndex: 2,
          imagePath: 'assets/images/i8.jpeg'),
      Question(
          question: "Which Egyptian festival marks the flooding of the Nile?",
          options: [
            "Wepet Renpet",
            "Sham El-Nessim",
            "Opet Festival",
            "Abu Simbel Sun Festival"
          ],
          correctIndex: 2,
          imagePath: 'assets/images/i9.jpeg'),
      Question(
          question:
              "Which lake was created by the construction of the Aswan High Dam?",
          options: ["Lake Victoria", "Lake Tana", "Lake Nasser", "Lake Qarun"],
          correctIndex: 2,
          imagePath: 'assets/images/i10.jpeg'),
    ],
    "advanced": [
      Question(
          question:
              "Which dynasty is considered the start of Ancient Egypt’s Old Kingdom?",
          options: ["18th", "4th", "12th", "26th"],
          correctIndex: 1,
          imagePath: 'assets/images/a1.jpeg'),
      Question(
          question:
              "Which ancient temple aligns with the sun so that twice a year, light illuminates the inner sanctum?",
          options: [
            "Temple of Karnak",
            "Temple of Hatshepsut",
            "Abu Simbel",
            "Medinet Habu"
          ],
          correctIndex: 2,
          imagePath: 'assets/images/a2.jpeg'),
      Question(
          question: "Who was the last pharaoh of Egypt before Roman rule?",
          options: [
            "Cleopatra VII",
            "Ramses III",
            "Thutmose IV",
            "Ptolemy XII"
          ],
          correctIndex: 0,
          imagePath: 'assets/images/a3.jpeg'),
      Question(
          question:
              "Which ancient Egyptian city was the center of trade and culture during the Ptolemaic period?",
          options: ["Memphis", "Alexandria", "Abydos", "Hermopolis"],
          correctIndex: 1,
          imagePath: 'assets/images/a4.jpeg'),
      Question(
          question: "What was the primary purpose of the Temple of Edfu?",
          options: [
            "Burial site",
            "Military headquarters",
            "Worship of Horus",
            "Marketplace"
          ],
          correctIndex: 2,
          imagePath: 'assets/images/a5.jpeg'),
      Question(
          question:
              "Which Egyptian god was often depicted as a falcon-headed deity?",
          options: ["Osiris", "Thoth", "Ra", "Horus"],
          correctIndex: 3,
          imagePath: 'assets/images/a6.jpeg'),
      Question(
          question:
              "Which ancient Egyptian text served as a guide for the afterlife?",
          options: [
            "The Pyramid Texts",
            "The Book of the Dead",
            "The Amarna Letters",
            "The Rosetta Script"
          ],
          correctIndex: 1,
          imagePath: 'assets/images/a7.jpeg'),
      Question(
          question:
              "What was the primary building material for ancient Egyptian temples and pyramids?",
          options: ["Sandstone", "Granite", "Limestone", "Mudbrick"],
          correctIndex: 2,
          imagePath: 'assets/images/a8.jpg'),
      Question(
          question:
              "Which Pharaoh was known as the 'Napoleon of Ancient Egypt' due to his military conquests?",
          options: ["Ramses II", "Thutmose III", "Akhenaten", "Amenhotep III"],
          correctIndex: 1,
          imagePath: 'assets/images/a9.jpeg'),
      Question(
          question:
              "Which major canal connects the Mediterranean Sea to the Red Sea?",
          options: [
            "Panama Canal",
            "Suez Canal",
            "Corinth Canal",
            "Kiel Canal"
          ],
          correctIndex: 1,
          imagePath: 'assets/images/a10.jpeg'),
    ],
  };
}
