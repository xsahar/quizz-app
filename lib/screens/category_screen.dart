import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  static const Color backgroundColor = Color(0xFFE2E4EC);
  static const Color primaryColor = Color(0xFF7209B7);
  static const Color secondaryColor = Color(0xFF3A0CA3);
  static const Color textColor = Color(0xFF1E293B);

  final List<Map<String, dynamic>> categories = const [
    {
      'name': 'General Knowledge',
      'icon': Icons.account_balance,
      'image': 'assets/general-knowledge.jpg',
      'color': Color(0xFF7209B7),
    },
    {
      'name': 'Geography',
      'icon': Icons.public,
      'image': 'assets/geography.jpg',
      'color': Color(0xFF4361EE),
    },
    {
      'name': 'Science',
      'icon': Icons.science,
      'image': 'assets/science.jpg',
      'color': Color(0xFF2A9D8F),
    },
    {
      'name': 'Sports',
      'icon': Icons.sports,
      'image': 'assets/sports.jpg',
      'color': Color(0xFFF4A261),
    },
    {
      'name': 'Math',
      'icon': Icons.calculate,
      'image': 'assets/math.jpg',
      'color': Color(0xFFE76F51),
    },
    {
      'name': 'Film',
      'icon': Icons.movie,
      'image': 'assets/film.jpg',
      'color': Color(0xFFF3722C),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Choose a Category',
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Explore Topics',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Choose a topic and test your knowledge.',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.88,
                  ),
                  itemBuilder: (context, index) {
                    final category = categories[index];

                    // Use a default color if a category has no color.
                    final categoryColor =
                        category['color'] as Color? ?? primaryColor;
                    final categoryImage = category['image'] as String?;

                    return InkWell(
                      borderRadius: BorderRadius.circular(22),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              '${category['name']} quiz coming next!',
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: categoryImage != null
                              ? Stack(
                                  fit: StackFit.expand,
                                  children: [
                                    Image.asset(
                                      categoryImage,
                                      fit: BoxFit.cover,
                                    ),
                                    const DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black54,
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 16,
                                      right: 16,
                                      bottom: 16,
                                      child: Text(
                                        category['name'] as String,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: categoryColor.withOpacity(
                                            0.12,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
                                        ),
                                        child: Icon(
                                          category['icon'] as IconData,
                                          size: 40,
                                          color: categoryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 18),
                                      Text(
                                        category['name'] as String,
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
