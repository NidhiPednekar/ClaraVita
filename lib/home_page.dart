import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Define the color scheme based on the image
  final Color primaryPurple = const Color(0xFF4A3B78);
  final Color lightPurple = const Color(0xFF8878C7);
  final Color pinkAccent = const Color(0xFFF1A5C8);
  final Color softBlue = const Color(0xFFB2C9F0);
  final Color backgroundGradientStart = const Color(0xFF1A1032);
  final Color backgroundGradientEnd = const Color(0xFF3A2160);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [backgroundGradientStart, backgroundGradientEnd],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: _buildPlaceholderContent(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: backgroundGradientStart,
          selectedItemColor: pinkAccent,
          unselectedItemColor: softBlue.withOpacity(0.6),
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.photo_library),
              label: 'Memory Vault',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Relax Games',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.self_improvement),
              label: 'Meditation',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.spa),
              label: 'Women\'s Wellness',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ClaraVita',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'Your calm companion',
                style: TextStyle(
                  fontSize: 16,
                  color: pinkAccent,
                ),
              ),
            ],
          ),
          CircleAvatar(
            backgroundColor: pinkAccent.withOpacity(0.2),
            radius: 24,
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  // Placeholder content until we implement the individual pages
  Widget _buildPlaceholderContent() {
    List<String> titles = [
      'Memory Vault',
      'Relaxation Games',
      'Meditation Hub',
      'Women\'s Wellness'
    ];
    
    List<IconData> icons = [
      Icons.photo_library,
      Icons.games,
      Icons.self_improvement,
      Icons.spa
    ];
    
    List<String> descriptions = [
      'Store and revisit your happiest moments',
      'Play relaxing games to calm your mind',
      'Guided meditations and soothing sounds',
      'Wellness resources tailored for women'
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titles[_currentIndex],
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            descriptions[_currentIndex],
            style: TextStyle(
              fontSize: 16,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 40),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons[_currentIndex],
                  size: 80,
                  color: lightPurple,
                ),
                const SizedBox(height: 24),
                Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'We\'re working on this feature.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: pinkAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Explore Other Features',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}