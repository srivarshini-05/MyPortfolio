import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // ✅ Import url_launcher
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // ✅ For LinkedIn & GitHub icons
import '../widgets/nav_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 800;

    return Scaffold(
      backgroundColor: const Color(0xFFE6FBFC), // ✅ light cyan background
      appBar: const NavBar(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // HEADER SECTION
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 160,
                      height: 160,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Colors.cyan, Colors.teal],
                        ),
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/profile.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [Colors.cyan, Colors.teal],
                          ),
                          border: Border.all(color: Colors.white, width: 4),
                        ),
                        child: const Center(
                          child: Text("👋", style: TextStyle(fontSize: 22)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                const Text("Srivarshini P",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                const Text("Full Stack Developer",
                    style: TextStyle(fontSize: 20, color: Colors.cyan)),
                const SizedBox(height: 12),

                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 10,
                  children: const [
                    _InfoRow(icon: Icons.mail, text: "psrivarshini005@gmail.com"),
                    _InfoRow(icon: Icons.phone, text: "7538848395"),
                    _InfoRow(icon: Icons.location_on, text: "Chennai, India"),
                  ],
                ),
                const SizedBox(height: 20),

                Wrap(
                  spacing: 12,
                  alignment: WrapAlignment.center,
                  children: const [
                    _OutlinedButton(
                      icon: FontAwesomeIcons.linkedin, // ✅ LinkedIn icon
                      label: "LinkedIn",
                      color: Colors.blue,
                      url: "https://www.linkedin.com/in/srivarshini005/",
                    ),
                    _OutlinedButton(
                      icon: FontAwesomeIcons.github, // ✅ GitHub icon
                      label: "GitHub",
                      color: Colors.black,
                      url: "https://github.com/srivarshini-05",
                    ),
                    _OutlinedButton(
                      icon: Icons.description, // ✅ Resume (PDF icon)
                      label: "Resume",
                      color: Colors.red,
                      url:
                          "https://drive.google.com/file/d/19B30uyVTJHM7NwUHZosXwnyBF6Kodwn0/view?usp=sharing",
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // PROFESSIONAL SUMMARY
                _GradientCard(
                  emoji: "🎯",
                  title: "Professional Summary",
                  child: const Text(
                    "Computer Science student with proven problem-solving ability, "
                    "reflected through 150+ solved LeetCode problems and a 100-day streak. "
                    "Passionate about full-stack development with experience in building "
                    "innovative solutions using modern technologies including Python, React, "
                    "and various web frameworks.",
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                ),
                const SizedBox(height: 30),

                // INTERESTS & PASSION
                _GradientCard(
                  emoji: "💡",
                  title: "Interests & Passion",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _InterestBlock(
                        title: "Full Stack Development",
                        description:
                            "Passionate about creating end-to-end web applications, "
                            "from designing intuitive user interfaces to building robust backend systems. "
                            "I enjoy working with modern frameworks and exploring new technologies "
                            "to deliver seamless user experiences.",
                        gradient: true,
                      ),
                      const SizedBox(height: 16),
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: isMobile ? 1 : 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 3,
                        children: const [
                          _InterestBlock(
                            title: "Problem Solving",
                            description:
                                "Enjoy tackling complex algorithmic challenges and optimizing solutions for better performance.",
                          ),
                          _InterestBlock(
                            title: "UI/UX Design",
                            description:
                                "Creating user-centered designs that balance aesthetics with functionality and accessibility.",
                          ),
                          _InterestBlock(
                            title: "Machine Learning",
                            description:
                                "Exploring AI/ML applications to solve real-world problems, especially in agriculture and healthcare.",
                          ),
                          _InterestBlock(
                            title: "Open Source",
                            description:
                                "Contributing to open source projects and collaborating with the developer community.",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // QUICK FACTS
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.cyan.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.cyan.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _SectionHeader(emoji: "🌟", title: "Quick Facts"),
                      const SizedBox(height: 20),
                      GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: isMobile ? 1 : 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.1,
                        children: const [
                          _FactCard(
                              emoji: "🏆",
                              number: "150+",
                              subtitle: "LeetCode Problems Solved"),
                          _FactCard(
                              emoji: "🎯",
                              number: "9.17",
                              subtitle: "Current CGPA"),
                          _FactCard(
                              emoji: "💼",
                              number: "2+",
                              subtitle: "Internship Experiences"),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ================== InfoRow ==================
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 6),
        Text(text, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

// ================== OutlinedButton ==================
class _OutlinedButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final String url;
  const _OutlinedButton(
      {required this.icon, required this.label, required this.color, required this.url});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => _launchURL(url),
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.cyan.shade200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      icon: Icon(icon, size: 18, color: color),
      label: Text(label, style: const TextStyle(fontSize: 14)),
    );
  }
}

// ================== GradientCard ==================
class _GradientCard extends StatelessWidget {
  final String emoji;
  final String title;
  final Widget child;
  const _GradientCard({required this.emoji, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.cyan.shade200),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SectionHeader(emoji: emoji, title: title),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

// ================== SectionHeader ==================
class _SectionHeader extends StatelessWidget {
  final String emoji;
  final String title;
  const _SectionHeader({required this.emoji, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(emoji, style: const TextStyle(fontSize: 22)),
        const SizedBox(width: 8),
        Text(title,
            style: const TextStyle(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87)),
      ],
    );
  }
}

// ================== InterestBlock ==================
class _InterestBlock extends StatelessWidget {
  final String title;
  final String description;
  final bool gradient;
  const _InterestBlock({required this.title, required this.description, this.gradient = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: gradient ? null : Colors.white,
        gradient: gradient
            ? const LinearGradient(colors: [Color(0xFFE0F7FA), Color(0xFFE0F2F1)])
            : null,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 6),
          Text(description, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}

// ================== FactCard ==================
class _FactCard extends StatelessWidget {
  final String emoji;
  final String number;
  final String subtitle;
  const _FactCard({required this.emoji, required this.number, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.cyan.shade100),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 10),
          Text(number,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.cyan)),
          const SizedBox(height: 6),
          Text(subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, color: Colors.black87)),
        ],
      ),
    );
  }
}
