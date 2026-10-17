import '../models/category.dart';
import '../models/question.dart';

class QuizData {
  static const categories = [
    Category(
      name: 'General Knowledge',
      imageAsset: 'assets/general-knowledge.jpg',
      questions: [
        Question(text: 'The Sun is a star.', answer: true),
        Question(
          text: 'The Great Wall of China is visible from the Moon with the naked eye.',
          answer: false,
        ),
        Question(
          text: 'Honey can remain edible for a very long time when stored properly.',
          answer: true,
        ),
        Question(text: 'An octopus has three hearts.', answer: true),
        Question(
          text: 'Venus is the hottest planet in our solar system.',
          answer: true,
        ),
        Question(
          text: 'Lightning never strikes the same place twice.',
          answer: false,
        ),
        Question(text: 'An adult human typically has 206 bones.', answer: true),
        Question(text: 'Bats are blind.', answer: false),
        Question(text: 'A group of lions is called a pride.', answer: true),
        Question(text: 'The chemical symbol for gold is Ag.', answer: false),
      ],
    ),
    Category(
      name: 'Geography',
      imageAsset: 'assets/geography.jpg',
      questions: [
        Question(
          text: 'The Pacific Ocean is the largest ocean on Earth.',
          answer: true,
        ),
        Question(text: 'Canberra is the capital of Australia.', answer: true),
        Question(
          text: 'The Sahara is the largest hot desert in the world.',
          answer: true,
        ),
        Question(text: 'Asia is the most populous continent.', answer: true),
        Question(text: 'Mount Everest is in Africa.', answer: false),
        Question(text: 'Japan is an island country.', answer: true),
        Question(text: 'The Equator passes through Brazil.', answer: true),
        Question(text: 'Reykjavik is the capital of Iceland.', answer: true),
        Question(text: 'All of Russia lies in Europe.', answer: false),
        Question(text: 'The Mediterranean Sea is an ocean.', answer: false),
      ],
    ),
    Category(
      name: 'Science',
      imageAsset: 'assets/science.jpg',
      questions: [
        Question(text: 'Water has the chemical formula H2O.', answer: true),
        Question(
          text: 'An electron has a positive electric charge.',
          answer: false,
        ),
        Question(
          text: 'Plants absorb carbon dioxide during photosynthesis.',
          answer: true,
        ),
        Question(text: 'Light travels faster than sound.', answer: true),
        Question(text: 'Mammals are cold-blooded animals.', answer: false),
        Question(text: 'Mars is often called the Red Planet.', answer: true),
        Question(
          text: 'Water always boils at 100 degrees Celsius, regardless of altitude.',
          answer: false,
        ),
        Question(text: 'DNA usually forms a double helix.', answer: true),
        Question(
          text: 'Gravity pushes objects away from one another.',
          answer: false,
        ),
        Question(text: 'A human heart has four chambers.', answer: true),
      ],
    ),
    Category(
      name: 'Sports',
      imageAsset: 'assets/sports.jpg',
      questions: [
        Question(
          text:
              'A soccer team has 11 players on the field during regular play.',
          answer: true,
        ),
        Question(text: 'Wimbledon is a major tennis tournament.', answer: true),
        Question(
          text: 'The Summer and Winter Olympic Games are both held every year.',
          answer: false,
        ),
        Question(
          text: 'A successful basketball free throw is worth one point.',
          answer: true,
        ),
        Question(
          text: 'The official marathon distance is 42.195 kilometres.',
          answer: true,
        ),
        Question(text: 'The Tour de France is a cycling race.', answer: true),
        Question(text: 'Ice hockey is played with a puck.', answer: true),
        Question(text: 'In tennis, the score after 30 is 40.', answer: true),
        Question(
          text: 'Rugby is played with an oval-shaped ball.',
          answer: true,
        ),
        Question(
          text: 'A standard soccer match has three halves.',
          answer: false,
        ),
      ],
    ),
    Category(
      name: 'Math',
      imageAsset: 'assets/math.jpg',
      questions: [
        Question(text: '17 is a prime number.', answer: true),
        Question(text: 'The square root of 81 is 9.', answer: true),
        Question(text: 'Pi is exactly equal to 3.14.', answer: false),
        Question(
          text: 'The interior angles of a triangle add up to 180 degrees in Euclidean geometry.',
          answer: true,
        ),
        Question(text: 'Zero is an even number.', answer: true),
        Question(text: '7 multiplied by 8 equals 54.', answer: false),
        Question(text: 'The number 1 is a prime number.', answer: false),
        Question(text: 'Every rectangle has four equal sides.', answer: false),
        Question(text: 'One kilometre is equal to 1,000 metres.', answer: true),
        Question(text: 'Two to the power of five equals 32.', answer: true),
      ],
    ),
    Category(
      name: 'Film',
      imageAsset: 'assets/film.jpg',
      questions: [
        Question(
          text: 'The Academy Awards recognize achievements in film.',
          answer: true,
        ),
        Question(
          text: 'A screenplay is written for a film or television production.',
          answer: true,
        ),
        Question(text: 'A trilogy consists of four films.', answer: false),
        Question(text: 'Animation is a filmmaking technique.', answer: true),
        Question(
          text:
              'A film director helps guide the creative production of a movie.',
          answer: true,
        ),
        Question(
          text: 'The Cannes Film Festival takes place in France.',
          answer: true,
        ),
        Question(
          text: 'A cameo is usually a brief appearance by a person in a film.',
          answer: true,
        ),
        Question(
          text: 'The Academy Award statuette is commonly called an Oscar.',
          answer: true,
        ),
        Question(
          text: 'A movie soundtrack is a collection of visual effects.',
          answer: false,
        ),
        Question(text: 'Hollywood is a district of Los Angeles.', answer: true),
      ],
    ),
  ];
}
