import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentIndex;
  const NavBar({super.key, required this.currentIndex});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  void navigate(BuildContext context, int index) {
    if (index == currentIndex) return;
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/'); // ✅ Fixed (Home route is '/')
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/education');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/skills');
        break;
      case 3:
        Navigator.pushReplacementNamed(context, '/experience');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 768;

    final pages = [
      {"id": 0, "label": "About", "icon": "👋"},
      {"id": 1, "label": "Education", "icon": "🎓"},
      {"id": 2, "label": "Skills & Projects", "icon": "💻"},
      {"id": 3, "label": "Experience & Awards", "icon": "🏆"},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        border: Border(
          bottom: BorderSide(color: Colors.cyan.shade200),
        ),
      ),
      child: SafeArea(
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left logo + name
              Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.cyan, Colors.teal],
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "SP",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Srivarshini P",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              // Desktop Navigation
              if (!isMobile)
                Row(
                  children: pages.map((page) {
                    bool active = currentIndex == page["id"];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: TextButton(
                          onPressed: () => navigate(context, page["id"] as int),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ).copyWith(
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (active) {
                                return Colors.cyan; // fallback (gradient below)
                              }
                              if (states.contains(MaterialState.hovered)) {
                                return Colors.cyan.shade50; // hover bg
                              }
                              return Colors.transparent;
                            }),
                          ),
                          child: Container(
                            decoration: active
                                ? BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Colors.cyan, Colors.teal],
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  )
                                : null,
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 10),
                            child: Row(
                              children: [
                                Text(page["icon"] as String),
                                const SizedBox(width: 6),
                                Text(
                                  page["label"] as String,
                                  style: TextStyle(
                                    fontWeight: active
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: active
                                        ? Colors.white
                                        : Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),

              // Mobile Dropdown
              if (isMobile)
                DropdownButton<int>(
                  value: currentIndex,
                  underline: const SizedBox(),
                  onChanged: (val) {
                    if (val != null) navigate(context, val);
                  },
                  items: pages.map((page) {
                    return DropdownMenuItem<int>(
                      value: page["id"] as int,
                      child: Row(
                        children: [
                          Text(page["icon"] as String),
                          const SizedBox(width: 6),
                          Text(page["label"] as String),
                        ],
                      ),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
