import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String greeting;
  late Timer _timer;
  final List<Map<String, String>> _quotes = [
    {
      'quote': 'Your time is limited, don\'t waste it living someone else\'s life.',
      'author': 'Steve Jobs',
    },
    {
      'quote': 'Happiness is not something ready made. It comes from your own actions.',
      'author': 'Dalai Lama',
    },
    {
      'quote': 'Keep your face always toward the sunshine—and shadows will fall behind you.',
      'author': 'Walt Whitman',
    },
    {
      'quote': 'The only way to do great work is to love what you do.',
      'author': 'Steve Jobs',
    },
    {
      'quote': 'You are never too old to set another goal or to dream a new dream.',
      'author': 'C.S. Lewis',
    },
  ];
  int _currentQuoteIndex = 0;

  @override
  void initState() {
    super.initState();
    greeting = _getGreeting();
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      setState(() {
        greeting = _getGreeting();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 5) return 'Good Night,';
    if (hour < 12) return 'Good Morning,';
    if (hour < 17) return 'Good Afternoon,';
    if (hour < 20) return 'Good Evening,';
    return 'Good Night,';
  }

  void _refreshQuote() {
    setState(() {
      _currentQuoteIndex = (_currentQuoteIndex + 1) % _quotes.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/peaceful.jpeg',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.white.withOpacity(0.18),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          greeting,
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.blue.shade300,
                          radius: 24,
                          child: const Icon(Icons.person, color: Colors.white, size: 28),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    // Quote Box
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      elevation: 4,
                      color: Colors.white.withOpacity(0.95),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.format_quote, color: Colors.blue, size: 26),
                                const SizedBox(width: 8),
                                const Text(
                                  'Daily Positive Quote',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  icon: const Icon(Icons.refresh, color: Colors.blue),
                                  onPressed: _refreshQuote,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              '"${_quotes[_currentQuoteIndex]['quote']}"',
                              style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 17,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '- ${_quotes[_currentQuoteIndex]['author']}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    // Mood Check-in
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      elevation: 2,
                      color: Colors.black,
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.white12,
                          child: Icon(Icons.emoji_emotions, color: Colors.white, size: 28),
                        ),
                        title: const Text(
                          'How are you feeling today?',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        subtitle: const Text('Tap to check in with your mood', style: TextStyle(color: Colors.white70)),
                        trailing: const Icon(Icons.chevron_right, color: Colors.white54),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const MoodSelectionPage()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'Quick Actions',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _quickActionCard(Icons.music_note, 'Relaxing Sounds', Colors.teal),
                        _quickActionCard(Icons.games, 'Games', Colors.purple),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _quickActionCard(Icons.self_improvement, 'Meditation', Colors.blue),
                        _quickActionCard(Icons.spa, 'Wellness', Colors.pinkAccent),
                      ],
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.white70,
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
            label: 'Wellness',
          ),
        ],
        onTap: (index) {
          // Add navigation logic for each section if needed
        },
      ),
    );
  }

  Widget _quickActionCard(IconData icon, String label, Color color) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        elevation: 2,
        color: Colors.white.withOpacity(0.93),
        child: InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () {}, // Add navigation logic
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: color.withOpacity(0.13),
                  child: Icon(icon, color: color, size: 32),
                  radius: 28,
                ),
                const SizedBox(height: 10),
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MoodSelectionPage extends StatelessWidget {
  const MoodSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'How are you feeling today?',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'Select your current mood:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                _moodCard(
                  context,
                  color: Colors.yellow,
                  icon: Icons.sentiment_satisfied_alt,
                  title: 'Happy',
                  subtitle: 'I feel positive and content',
                ),
                _moodCard(
                  context,
                  color: Colors.blue,
                  icon: Icons.sentiment_dissatisfied,
                  title: 'Sad',
                  subtitle: 'I feel down or unhappy',
                ),
                _moodCard(
                  context,
                  color: Colors.purple,
                  icon: Icons.sentiment_neutral,
                  title: 'Anxious',
                  subtitle: 'I feel worried or nervous',
                ),
                _moodCard(
                  context,
                  color: Colors.red,
                  icon: Icons.sentiment_very_dissatisfied,
                  title: 'Angry',
                  subtitle: 'I feel frustrated or upset',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _moodCard(BuildContext context, {required Color color, required IconData icon, required String title, required String subtitle}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.18),
          child: Icon(icon, color: color, size: 32),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.chevron_right, color: Colors.white54),
        onTap: () {},
      ),
    );
  }
}