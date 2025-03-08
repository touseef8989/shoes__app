class OnboardModel {
  String image;
  String title;
  String description;
  OnboardModel({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<OnboardModel> shoesData = [
  OnboardModel(
    description: "Running shoes tend to be lighter in weight but heavier in cushioning, especially for the heel and the toe.",
    title: "Addidas",
    image: "assets/onb-1.png",
  ),
    OnboardModel(
    description: "Since running is a more intense sport, runners tend to exert more energy.",
    title: "Strut",
    image: "assets/onb-2.png",
  ),
    OnboardModel(
    description: "Your feet get hot, and most running shoes are made of mesh to allow air to move freely",
    title: "Solina",
    image: "assets/onb-3.png",
  ),
];
