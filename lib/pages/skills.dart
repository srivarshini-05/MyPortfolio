import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // ✅ for opening links
import '../widgets/nav_bar.dart';

class SkillsProjectsPage extends StatelessWidget {
  const SkillsProjectsPage({super.key});

  // ================== HELPER: OPEN URL ==================
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $url");
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    // 🔹 Programming Languages
    final programmingLanguages = [
      {"name": "Python", "icon": Icons.code, "category": "Backend"},
      {"name": "JavaScript", "icon": Icons.javascript, "category": "Frontend"},
      {"name": "Java", "icon": Icons.coffee, "category": "Backend"},
      {"name": "C", "icon": Icons.memory, "category": "System"},
      {"name": "HTML", "icon": Icons.language, "category": "Frontend"},
      {"name": "CSS", "icon": Icons.brush, "category": "Frontend"},
      {"name": "MySQL", "icon": Icons.storage, "category": "Database"},
      {"name": "Dart", "icon": Icons.adjust, "category": "Mobile"},
    ];

    // 🔹 Tools
    final tools = [
      {"name": "Streamlit", "category": "Framework"},
      {"name": "FastAPI", "category": "Framework"},
      {"name": "Flutter", "category": "Mobile Framework"},
      {"name": "Firebase", "category": "Backend Service"},
      {"name": "VS Code", "category": "Editor"},
      {"name": "Figma", "category": "Design"},
      {"name": "Canva", "category": "Design"},
      {"name": "Google Colab", "category": "ML Platform"},
      {"name": "Git", "category": "Version Control"},
    ];

    // 🔹 Coding stats
    final codingStats = [
      {"platform": "LeetCode", "problems": "150+", "achievement": "50 days Badge 2024"},
      {"platform": "SkillRack", "problems": "1000+", "achievement": "328 Bronze Medals"},
    ];

    // 🔹 Projects with GitHub + Demo links
    final projects = [
      {
        "title": "Smart Airport Parking Management ",
        "category": "Full Stack",
        "description":
            "Designed and developed a smart parking prototype to optimize airport parking slot allocation based on flight details (flight number, gate, and departure time).",
        "tech": ["Flutter", "Dart", "Firebase", "Rule-based Algorithm (future ML integration)"],
        "github": "https://github.com/srivarshini-05/airport_parking",
      },
      {
        "title": "Clay Keychain E-commerce",
        "category": "Full Stack",
        "description":
            "Designed and developed a responsive e-commerce prototype from Figma using Flutter; implemented three category filters with representative imagery, category-specific product listings, reusable navigation, and responsive product grid with Add-to-Cart placeholders.",
        "tech": ["Flutter", "Dart", "Firebase"],
        "featured": true,
        "github": "https://github.com/srivarshini-05/SSY_CRAFTYBOX",
        "demo": "https://ssy-handmade.web.app/#/login",
      },
      {
        "title": "Smart Notes & Study Material Hub",
        "category": "Full Stack",
        "description":
            "Designed and developed a full-stack academic collaboration platform to help students upload, browse, and share study notes, while also enabling social interaction through features like likes, comments, follow/unfollow, and private messaging.",
        "tech": ["Streamlit", "FastAPI", "SQLite"],
        "featured": true,
        "github": "https://github.com/srivarshini-05/smart-notes-hub",
      },
      {
        "title": "AI Driven Cauliflower Disease Detection",
        "category": "AI/ML",
        "description":
            "Developed a machine learning prototype to identify cauliflower plant diseases and suggest relevant treatment recommendations using computer vision and ML algorithms.",
        "tech": ["Google Colab", "Python", "Machine Learning"],
        "teamwork": true,
      },
      {
        "title": "Stock Management System",
        "category": "Database Management",
        "description":
            "Designed and developed a Stock Management System tailored for a stationery shop, aimed at assisting accountancy students in understanding and managing inventory-related concepts.",
        "tech": ["Python", "MySQL"],
      },
    ];

    return Scaffold(
      appBar: const NavBar(currentIndex: 2),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE6FBFF), Color(0xFFEFFBF9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1100),
              child: Column(
                children: [
                  // Page header
                  const Icon(Icons.computer, color: Colors.cyan, size: 40),
                  const SizedBox(height: 8),
                  const Text("Skills & Projects",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87)),
                  const SizedBox(height: 4),
                  const Text("Technical expertise and innovative projects",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 16)),

                  const SizedBox(height: 24),

                  // Sections
                  _buildProgrammingLanguages(programmingLanguages, isMobile),
                  const SizedBox(height: 24),

                  _buildTools(tools),
                  const SizedBox(height: 24),

                  _buildCodingPerformance(codingStats, isMobile),
                  const SizedBox(height: 24),

                  _buildProjects(projects),
                  const SizedBox(height: 24),

                  _buildHighlights(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= PROGRAMMING LANGUAGES =================
  static Widget _buildProgrammingLanguages(List<Map<String, Object>> languages, bool isMobile) {
    return _buildSection(
      icon: Icons.code,
      title: "Programming Languages",
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: languages.map((lang) {
          return Container(
            width: isMobile ? double.infinity : 240,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.cyan.shade100),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(lang["icon"] as IconData, size: 40, color: Colors.cyan),
                const SizedBox(height: 8),
                Text(lang["name"] as String,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                _buildBadge(lang["category"] as String, category: lang["category"] as String),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ================= TOOLS =================
  static Widget _buildTools(List<Map<String, String>> tools) {
    return _buildSection(
      icon: Icons.build,
      title: "Tools & Technologies",
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: tools.map((tool) {
          return _buildBadge("${tool["name"]} (${tool["category"]})",
              category: tool["category"]);
        }).toList(),
      ),
    );
  }

  // ================= CODING PERFORMANCE =================
  static Widget _buildCodingPerformance(List<Map<String, String>> stats, bool isMobile) {
    return _buildSection(
      icon: Icons.bar_chart,
      title: "Coding Performance",
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: stats.map((stat) {
          return Container(
            width: isMobile ? double.infinity : 320,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE6FAFF), Color(0xFFEFFFFA)],
              ),
              border: Border.all(color: Colors.cyan.shade100),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(stat["platform"]!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(stat["problems"]!,
                    style: const TextStyle(fontSize: 28, color: Colors.cyan)),
                const Text("Problems Solved",
                    style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 8),
                _buildBadge(stat["achievement"]!, category: "Achievement"),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ================= PROJECTS =================
  Widget _buildProjects(List<Map<String, Object>> projects) {
    return _buildSection(
      icon: Icons.work,
      title: "Featured Projects",
      child: Column(
        children: projects.map((project) {
          final techList = (project["tech"] as List<String>?) ?? [];
          final isFeatured = project["featured"] == true;

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isFeatured ? const Color(0xFFE6FBFF) : Colors.white,
              border: Border.all(
                  color: isFeatured ? Colors.cyan.shade300 : Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(project["title"] as String,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    if (isFeatured) _buildBadge("⭐ Featured", category: "Achievement"),
                    if (project["teamwork"] == true)
                      _buildBadge("Team Project", category: "Backend"),
                  ],
                ),
                const SizedBox(height: 8),
                _buildBadge(project["category"] as String, category: "System"),
                const SizedBox(height: 8),
                Text(project["description"] as String,
                    style: const TextStyle(color: Colors.black87)),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: techList
                      .map((tech) => _buildBadge(tech, category: "System"))
                      .toList(),
                ),
                const SizedBox(height: 12),
                if (project["github"] != null || project["demo"] != null)
                  Row(
                    children: [
                      if (project["github"] != null)
                        OutlinedButton.icon(
                          onPressed: () =>
                              _launchURL(project["github"] as String),
                          icon: const Icon(Icons.code,
                              size: 18, color: Colors.cyan),
                          label: const Text("View Code"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.cyan,
                            side: BorderSide(color: Colors.cyan.shade300),
                          ),
                        ),
                      if (project["demo"] != null) ...[
                        const SizedBox(width: 12),
                        OutlinedButton.icon(
                          onPressed: () =>
                              _launchURL(project["demo"] as String),
                          icon: const Icon(Icons.open_in_new,
                              size: 18, color: Colors.cyan),
                          label: const Text("Live Demo"),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.cyan,
                            side: BorderSide(color: Colors.cyan.shade300),
                          ),
                        ),
                      ],
                    ],
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ================= HIGHLIGHTS =================
  static Widget _buildHighlights() {
    final highlights = [
      {"icon": "🚀", "value": "3", "label": "Major Projects"},
      {"icon": "💻", "value": "8", "label": "Programming Languages"},
      {"icon": "🔧", "value": "9+", "label": "Tools & Frameworks"},
      {"icon": "🏆", "value": "650+", "label": "Problems Solved"},
    ];

    return _buildSection(
      icon: Icons.star,
      title: "Development Highlights",
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: highlights.map((item) {
          return Container(
            width: 220,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.cyan.shade100),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(item["icon"]!, style: const TextStyle(fontSize: 28)),
                const SizedBox(height: 6),
                Text(item["value"]!,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.cyan)),
                Text(item["label"]!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black54)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ================= SECTION WRAPPER =================
  static Widget _buildSection({required IconData icon, required String title, required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.cyan),
              const SizedBox(width: 8),
              Text(title,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  // ================= BADGE HELPER =================
  static Widget _buildBadge(String text, {String? category}) {
    Color bg = Colors.grey.shade200;
    Color fg = Colors.grey.shade700;

    switch (category) {
      case "Frontend":
        bg = Colors.blue.shade50;
        fg = Colors.blue.shade700;
        break;
      case "Backend":
        bg = Colors.green.shade50;
        fg = Colors.green.shade700;
        break;
      case "Database":
        bg = Colors.orange.shade50;
        fg = Colors.orange.shade700;
        break;
      case "System":
        bg = Colors.grey.shade100;
        fg = Colors.grey.shade700;
        break;
      case "Mobile":
        bg = Colors.purple.shade50;
        fg = Colors.purple.shade700;
        break;
      case "Achievement":
        bg = Colors.cyan.shade50;
        fg = Colors.cyan.shade700;
        break;
      case "Framework":
        bg = Colors.indigo.shade50;
        fg = Colors.indigo.shade700;
        break;
      case "Mobile Framework":
        bg = Colors.cyan.shade50;
        fg = Colors.cyan.shade700;
        break;
      case "Backend Service":
        bg = Colors.amber.shade50;
        fg = Colors.amber.shade700;
        break;
      case "Editor":
        bg = Colors.green.shade50;
        fg = Colors.green.shade700;
        break;
      case "Design":
        bg = Colors.purple.shade50;
        fg = Colors.purple.shade700;
        break;
      case "ML Platform":
        bg = Colors.deepOrange.shade50;
        fg = Colors.deepOrange.shade700;
        break;
      case "Version Control":
        bg = Colors.grey.shade50;
        fg = Colors.grey.shade600;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration:
          BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: TextStyle(fontSize: 12, color: fg)),
    );
  }
}
