import 'package:flutter/material.dart';
import '../widgets/nav_bar.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    final languages = [
      {"language": "Tamil", "proficiency": "Native", "flag": "🇮🇳", "level": 5},
      {"language": "English", "proficiency": "Fluent", "flag": "🇺🇸", "level": 4},
    ];

    final certificates = [
      {"title": "Python Programming Course", "issuer": "Coursty", "category": "Programming"},
      {"title": "Python For Data Science (ELITE- Silver)", "issuer": "NPTEL - IIT Madras", "category": "Data Science"},
      {"title": "Introduction to Machine Learning (ELITE- Silver)", "issuer": "NPTEL - IIT Madras", "category": "Machine Learning"},
      {"title": "Introduction to MongoDB", "issuer": "MongoDB University", "category": "Database"},
      {"title": "Introduction to Data Science", "issuer": "Cisco", "category": "Data Science"},
    ];

    return Scaffold(
      appBar: const NavBar(currentIndex: 1),
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
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🔹 Page Header (centered now)
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(Icons.school, color: Colors.cyan, size: 40),
                        SizedBox(height: 8),
                        Text(
                          "Education",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Academic background and continuous learning journey",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black54, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 🔹 Formal Education
                  _buildFormalEducation(),

                  const SizedBox(height: 24),

                  // 🔹 Languages
                  _buildLanguages(languages, isMobile),

                  const SizedBox(height: 24),

                  // 🔹 Certifications
                  _buildCertifications(certificates, isMobile),

                  const SizedBox(height: 24),

                  // 🔹 Academic Highlights
                  _buildAcademicHighlights(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ================= FORMAL EDUCATION =================
  Widget _buildFormalEducation() {
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
            children: const [
              Icon(Icons.menu_book, color: Colors.cyan),
              SizedBox(width: 8),
              Text("Formal Education",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),

          // Bachelor's
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE6FAFF), Colors.white],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              border: Border(left: BorderSide(color: Colors.cyan, width: 4)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "B.E. Computer Science and Engineering",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.cyan.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("2023 - 2027",
                          style: TextStyle(fontSize: 12, color: Colors.cyan)),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                const Text("St. Joseph's College of Engineering, Chennai, India",
                    style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade50,
                        border: Border.all(color: Colors.green.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("CGPA: 9.17/10.0",
                          style: TextStyle(fontSize: 12, color: Colors.green)),
                    ),
                    const SizedBox(width: 10),
                    const Text("Currently Pursuing",
                        style: TextStyle(color: Colors.black54)),
                  ],
                )
              ],
            ),
          ),

          // 12th Grade
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFEFFFFA), Colors.white],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              border: Border(left: BorderSide(color: Colors.teal, width: 4)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("12th Grade (CBSE)",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text("2023",
                          style: TextStyle(fontSize: 12, color: Colors.teal)),
                    )
                  ],
                ),
                const SizedBox(height: 4),
                const Text("Babaji Vidhyashram, Chennai, India",
                    style: TextStyle(color: Colors.black54)),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    border: Border.all(color: Colors.green.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text("Score: 92.2/100",
                      style: TextStyle(fontSize: 12, color: Colors.green)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ================= LANGUAGES =================
  Widget _buildLanguages(List<Map<String, Object>> languages, bool isMobile) {
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
            children: const [
              Icon(Icons.language, color: Colors.cyan),
              SizedBox(width: 8),
              Text("Languages",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: languages.map((lang) {
              return Container(
                width: isMobile ? double.infinity : 320,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFE6FAFF), Color(0xFFEAFBF9)],
                  ),
                  border: Border.all(color: Colors.cyan.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(lang["language"] as String,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: (lang["proficiency"] == "Native")
                                    ? Colors.green.shade100
                                    : Colors.blue.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(lang["proficiency"] as String,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: (lang["proficiency"] == "Native")
                                          ? Colors.green.shade700
                                          : Colors.blue.shade700)),
                            )
                          ],
                        ),
                        Row(
                          children: List.generate(
                            5,
                            (i) => Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2),
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: i < (lang["level"] as int)
                                    ? Colors.cyan
                                    : Colors.grey.shade300,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(lang["flag"] as String,
                        style: const TextStyle(fontSize: 22)),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  // ================= CERTIFICATIONS =================
  Widget _buildCertifications(List<Map<String, Object>> certificates, bool isMobile) {
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
            children: const [
              Icon(Icons.workspace_premium, color: Colors.cyan),
              SizedBox(width: 8),
              Text("Certifications",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: certificates.map((cert) {
              return Container(
                width: isMobile ? double.infinity : 320,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.cyan.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cert["title"] as String,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(cert["issuer"] as String,
                        style: const TextStyle(color: Colors.black54)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: cert["category"] == "Programming"
                            ? Colors.blue.shade50
                            : cert["category"] == "Data Science"
                                ? Colors.purple.shade50
                                : cert["category"] == "Machine Learning"
                                    ? Colors.green.shade50
                                    : Colors.orange.shade50,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(cert["category"] as String,
                          style: TextStyle(
                            fontSize: 12,
                            color: cert["category"] == "Programming"
                                ? Colors.blue.shade700
                                : cert["category"] == "Data Science"
                                    ? Colors.purple.shade700
                                    : cert["category"] == "Machine Learning"
                                        ? Colors.green.shade700
                                        : Colors.orange.shade700,
                          )),
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }

  // ================= ACADEMIC HIGHLIGHTS =================
  Widget _buildAcademicHighlights() {
    final highlights = [
      {"icon": "🎯", "value": "9.17", "label": "Current CGPA"},
      {"icon": "📚", "value": "5", "label": "Certifications Earned"},
      {"icon": "🌟", "value": "Elite Silver", "label": "NPTEL Achievement"},
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFE6FAFF), Color(0xFFEFFFFA)],
        ),
        border: Border.all(color: Colors.cyan.shade200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // center heading
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // center heading row
            children: const [
              Icon(Icons.emoji_events, color: Colors.cyan),
              SizedBox(width: 8),
              Text("Academic Highlights",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center, // center cards
            children: highlights.map((item) {
              return Container(
                width: 260,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.cyan.shade100),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Text(item["icon"] as String, style: const TextStyle(fontSize: 28)),
                    const SizedBox(height: 8),
                    Text(item["value"] as String,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan)),
                    const SizedBox(height: 4),
                    Text(item["label"] as String,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black54)),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
