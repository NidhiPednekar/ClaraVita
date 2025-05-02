import 'package:flutter/material.dart';

class WomensSection extends StatefulWidget {
  const WomensSection({Key? key}) : super(key: key);

  @override
  State<WomensSection> createState() => _WomensSectionState();
}

class _WomensSectionState extends State<WomensSection> {
  final List<Map<String, dynamic>> _resources = [
    {
      'title': 'Self-Care Practices',
      'description': 'Essential self-care routines to nurture your mind and body',
      'icon': Icons.spa,
      'color': Color(0xFFD6A4E8),
    },
    {
      'title': 'Stress Management',
      'description': 'Effective techniques to manage daily stress and anxiety',
      'icon': Icons.self_improvement,
      'color': Color(0xFFA18CD1),
    },
    {
      'title': 'Hormonal Health',
      'description': 'Understanding your hormones and emotional well-being',
      'icon': Icons.favorite,
      'color': Color(0xFFFFB6C1),
    },
    {
      'title': 'Mindful Motherhood',
      'description': 'Support for maternal mental health and parenting challenges',
      'icon': Icons.child_care,
      'color': Color(0xFF8BC6EC),
    },
    {
      'title': 'Work-Life Balance',
      'description': 'Strategies for maintaining balance and setting boundaries',
      'icon': Icons.balance,
      'color': Color(0xFF9FACE6),
    },
    {
      'title': 'Community Support',
      'description': 'Connect with other women through shared experiences',
      'icon': Icons.people,
      'color': Color(0xFFFF9A9E),
    },
  ];

  final List<Map<String, dynamic>> _featuredArticles = [
    {
      'title': 'The Power of Female Friendships for Mental Health',
      'image': 'assets/images/friendship.jpg',
      'author': 'Dr. Sarah Johnson',
    },
    {
      'title': 'Understanding PMS and Your Mental Wellbeing',
      'image': 'assets/images/wellness.jpg',
      'author': 'Dr. Amelia Chen',
    },
    {
      'title': 'Building Resilience: Women`s Unique Strengths',
      'image': 'assets/images/resilience.jpg',
      'author': 'Lisa Thompson, LMFT',
    },
  ];

  final List<String> _affirmations = [
    "I am enough just as I am.",
    "I honor my needs and prioritize my wellbeing.",
    "I embrace my feminine strength and wisdom.",
    "I am worthy of love, respect, and care.",
    "I celebrate my unique journey as a woman.",
    "I set healthy boundaries with confidence.",
    "I release expectations that don't serve me.",
    "I am resilient and can overcome any challenge.",
    "My voice matters and deserves to be heard.",
    "I am a powerful creator of my own happiness.",
  ];

  int _currentAffirmationIndex = 0;

  @override
  void initState() {
    super.initState();
    // Randomize starting affirmation
    _currentAffirmationIndex = DateTime.now().second % _affirmations.length;
  }

  void _nextAffirmation() {
    setState(() {
      _currentAffirmationIndex = (_currentAffirmationIndex + 1) % _affirmations.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Women\'s Wellbeing'),
        backgroundColor: const Color(0xFFA18CD1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFD6A4E8), Color(0xFFFFFFFF)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner Section
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF9796F0), Color(0xFFFBC7D4)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Women\'s Wellbeing',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Resources and support designed for women\'s unique mental health needs',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Add navigation to a quiz or assessment
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xFF9796F0),
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'Take Wellbeing Assessment',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 25),
                
                // Daily Affirmation Card
                GestureDetector(
                  onTap: _nextAffirmation,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Color(0xFFFF9A9E),
                              size: 24,
                            ),
                            const SizedBox(width: 10),
                            const Text(
                              'Daily Affirmation',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.refresh,
                                color: Color(0xFF9796F0),
                              ),
                              onPressed: _nextAffirmation,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          _affirmations[_currentAffirmationIndex],
                          style: const TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF555555),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        const Center(
                          child: Text(
                            'Tap to see another affirmation',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(height: 25),
                
                // Resources Section
                const Text(
                  'Women\'s Wellness Resources',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: _resources.length,
                  itemBuilder: (context, index) {
                    final resource = _resources[index];
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: resource['color'].withOpacity(0.2),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              resource['icon'],
                              size: 35,
                              color: resource['color'],
                            ),
                          ),
                          const SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              resource['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              resource['description'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 25),
                
                // Featured Articles
                const Text(
                  'Featured Articles',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _featuredArticles.length,
                  itemBuilder: (context, index) {
                    final article = _featuredArticles[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Placeholder for image
                            Container(
                              height: 150,
                              width: double.infinity,
                              color: Color(0xFF9FACE6).withOpacity(0.7),
                              child: const Center(
                                child: Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article['title'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'By ${article['author']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          // Navigate to article
                                        },
                                        child: const Text(
                                          'Read More',
                                          style: TextStyle(
                                            color: Color(0xFFA18CD1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                
                const SizedBox(height: 25),
                
                // Community Support
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF5F7FA), Color(0xFFC3CFE2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.groups,
                              size: 30,
                              color: Color(0xFF9796F0),
                            ),
                          ),
                          const SizedBox(width: 15),
                          const Text(
                            'Join Our Community',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        'Connect with other women, share experiences, and find support in our safe and moderated community space.',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigate to community page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF9796F0),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Join Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}