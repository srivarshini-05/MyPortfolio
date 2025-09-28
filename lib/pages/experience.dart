import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';

class ExperienceAwardsPage extends StatelessWidget {
  const ExperienceAwardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(currentIndex: 3),
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
                  // Page Header
                  Column(
                    children: const [
                      Icon(Icons.emoji_events, color: Colors.cyan, size: 40),
                      SizedBox(height: 8),
                      Text(
                        "Experience & Achievements",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Professional journey, awards, and community contributions",
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Professional Experience
                  _buildProfessionalExperience(),

                  const SizedBox(height: 24),

                  // Awards & Achievements (responsive fix applied)
                  _buildAwards(),

                  const SizedBox(height: 24),

                  // Volunteer Work
                  _buildVolunteer(),

                  const SizedBox(height: 24),

                  // Achievement Summary
                  _buildSummary(),

                  const SizedBox(height: 24),

                  // Call to Action
                  _buildCTA(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ==================== PROFESSIONAL EXPERIENCE ====================
  static Widget _buildProfessionalExperience() {
    final experiences = [
      {
        "title": "Full Stack Developer Intern",
        "company": "Mphasis Ltd.",
        "location": "Chennai, India",
        "duration": "May 2025 - Present",
        "current": true,
        "type": "Internship",
        "responsibilities": [
          "Completed a full-stack Innovation Portal prototype using Python and Streamlit",
          "Currently working on a document segregation system that classifies PDFs (e.g., Aadhaar, Driving License) into folders using automation",
          "Developing automated solutions for enterprise document management"
        ]
      },
      {
        "title": "UI/UX Designer",
        "company": "RETECH Solutions Pvt Ltd",
        "location": "Chennai, India",
        "duration": "July 2024",
        "current": false,
        "type": "Internship",
        "responsibilities": [
          "Completed a 15-day UI/UX Design internship",
          "Received positive feedback from mentors for creativity and attention to design detail",
          "Worked on user interface design projects and prototyping"
        ]
      }
    ];

    return _buildSection(
      icon: Icons.work,
      title: "Professional Experience",
      child: Column(
        children: experiences.map((exp) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: exp["current"] == true
                    ? [Colors.green.shade50, Colors.white]
                    : [Colors.cyan.shade50, Colors.white],
              ),
              border: Border(
                left: BorderSide(
                  color: exp["current"] == true ? Colors.green : Colors.cyan,
                  width: 4,
                ),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title + Company
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(exp["title"] as String,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            Row(
                              children: [
                                const Icon(Icons.business,
                                    size: 16, color: Colors.grey),
                                const SizedBox(width: 4),
                                Flexible(
                                  child: Text(exp["company"] as String,
                                      style: const TextStyle(
                                          color: Colors.black54)),
                                ),
                              ],
                            ),
                          ]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        if (exp["current"] == true)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Text("Current Position",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            const Icon(Icons.calendar_today,
                                size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(exp["duration"] as String,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                size: 14, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(exp["location"] as String,
                                style: const TextStyle(
                                    color: Colors.black54, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildBadge(exp["type"] as String, category: "Internship"),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (exp["responsibilities"] as List<String>)
                      .map((resp) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("• ",
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 16)),
                              Expanded(
                                  child: Text(resp,
                                      style: const TextStyle(
                                          color: Colors.black87))),
                            ],
                          ))
                      .toList(),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ==================== AWARDS ====================
  static Widget _buildAwards() {
    final awards = [
      {
        "title": "SIMATS - Wissennaire'3 - Technical Quiz",
        "position": "1st Place",
        "description":
            "Won 1st place, showcasing strong problem-solving and core engineering knowledge.",
        "year": "2024",
        "category": "Competition",
        "icon": "🥇"
      },
      {
        "title": "Food Hackathon (CFTRI)",
        "position": "Top 10",
        "description":
            "Ranked in the Top 10 for a food-tech solution focused on sustainability and nutrition.",
        "year": "2024",
        "category": "Hackathon",
        "icon": "🍽️"
      },
      {
        "title": "INNOVATHON'25 - Ideathon",
        "position": "4th Place",
        "description":
            "Secured 4th place with an AI-based innovation for real-world problem-solving.",
        "year": "2025",
        "category": "Innovation",
        "icon": "💡"
      },
      {
        "title": "Crescent - Arcane'24 - Board Bully",
        "position": "1st Place",
        "description":
            "Placed 1st in a technical quiz, demonstrating subject expertise and quick thinking.",
        "year": "2024",
        "category": "Competition",
        "icon": "🎯"
      },
      {
        "title": "Elite Silver Certified Candidate",
        "position": "Certification",
        "description":
            "Achieved Elite Silver Certification in Python for Data Science from NPTEL - IIT Madras.",
        "year": "2024",
        "category": "Certification",
        "icon": "🏅"
      }
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = constraints.maxWidth < 600 ? 1 : 2; // ✅ Responsive
        return _buildSection(
          icon: Icons.emoji_events,
          title: "Awards & Achievements",
          child: GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            children: awards.map((award) {
              return Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow.shade50,
                  border: Border.all(color: Colors.yellow.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(award["icon"]!, style: const TextStyle(fontSize: 28)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Expanded(
                                child: Text(award["title"]!,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))),
                            _buildBadge(award["year"]!, category: "Year")
                          ]),
                          const SizedBox(height: 4),
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            children: [
                              _buildBadge(award["position"]!),
                              _buildBadge(award["category"]!,
                                  category: "Category"),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(award["description"]!,
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }

  // ==================== VOLUNTEER WORK ====================
  static Widget _buildVolunteer() {
    return _buildSection(
      icon: Icons.volunteer_activism,
      title: "Volunteer Work",
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.purple.shade50,
          border: Border.all(color: Colors.purple.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("IEEE Conference 2025 Coordinator",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text("St. Joseph's College of Engineering",
                style: TextStyle(color: Colors.black54)),
            SizedBox(height: 8),
            Text(
                "Coordinated and organized the IEEE Conference conducted by the Department of Computer Science and Engineering, St. Joseph's College of Engineering."),
            SizedBox(height: 8),
            Text(
                "Impact: Successfully managed conference logistics and ensured smooth execution of technical sessions",
                style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  // ==================== ACHIEVEMENT SUMMARY ====================
  static Widget _buildSummary() {
    final stats = [
      {"icon": "🏆", "value": "5", "label": "Awards Won"},
      {"icon": "💼", "value": "2", "label": "Internships Completed"},
      {"icon": "🥇", "value": "2", "label": "First Place Wins"},
      {"icon": "🤝", "value": "1", "label": "Volunteer Role"},
    ];

    return _buildSection(
      icon: Icons.star,
      title: "Achievement Summary",
      child: Wrap(
        spacing: 16,
        runSpacing: 16,
        alignment: WrapAlignment.center,
        children: stats.map((stat) {
          return SizedBox(
            width: 160, // ✅ smaller cards fit mobile
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.cyan.shade100),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(stat["icon"]!, style: const TextStyle(fontSize: 28)),
                  Text(stat["value"]!,
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.cyan)),
                  Text(stat["label"]!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.black54)),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ==================== CALL TO ACTION ====================
  static Widget _buildCTA() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Colors.cyan, Colors.teal],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: const [
          Text("Let's Connect!",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          SizedBox(height: 6),
          Text(
              "Interested in collaborating or learning more about my journey? I'd love to hear from you.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70)),
          SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              Chip(label: Text("📧 psrivarshini005@gmail.com")),
              Chip(label: Text("📱 7538848395")),
            ],
          )
        ],
      ),
    );
  }

  // ==================== SECTION WRAPPER ====================
  static Widget _buildSection(
      {required IconData icon, required String title, required Widget child}) {
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
          Row(children: [
            Icon(icon, color: Colors.cyan),
            const SizedBox(width: 8),
            Text(title,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),
          ]),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  // ==================== BADGES ====================
  static Widget _buildBadge(String text, {String? category}) {
    Color bg = Colors.grey.shade200;
    Color fg = Colors.grey.shade700;

    switch (category) {
      case "Internship":
        bg = Colors.cyan.shade50;
        fg = Colors.cyan.shade700;
        break;
      case "Year":
        bg = Colors.yellow.shade100;
        fg = Colors.yellow.shade800;
        break;
      case "Category":
        bg = Colors.grey.shade100;
        fg = Colors.grey.shade600;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)),
      child: Text(text, style: TextStyle(fontSize: 12, color: fg)),
    );
  }
}
