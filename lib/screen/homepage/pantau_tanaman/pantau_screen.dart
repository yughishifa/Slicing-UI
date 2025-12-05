import 'package:flutter/material.dart';
import 'package:hydropome/screen/homepage/pantau_tanaman/pantautanaman_screen.dart';
import '../../auth/personalization/clip_path.dart';

class PantauScreen extends StatelessWidget {
  const PantauScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F5F7),
      body: Column(
        children: [
          ClipPath(
            clipper: TopOvalClipper(),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 40),
              color: const Color(0xFF0F3836),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: 0,
                    bottom: -10,
                    child: IgnorePointer(
                      child: Opacity(
                        opacity: 1.0,
                        child: Image.asset(
                          "lib/core/assets/freepik--Tree--inject-3.png",
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Bagaimana Kabar\nTanamanmu Hari Ini?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),

                      const SizedBox(height: 20),

                      Material(
                        elevation: 6,
                        shadowColor: Colors.black26,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          height: 40,
                          child: const Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  "Cari tanaman kamu...",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Row(
                    children: const [
                      Text(
                        "Daftar Tanamanmu",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  plantItem(
                    context: context,
                    img: "lib/core/assets/selada.png",
                    title: "Selada Hidroponik",
                    difficulty: "Mudah",
                    day: "Hari ke-1",
                  ),

                  plantItem(
                    context: context,
                    img: "lib/core/assets/bayam.png",
                    title: "Bayam Hidroponik",
                    difficulty: "Mudah",
                    day: "Hari ke-5",
                  ),

                  plantItem(
                    context: context,
                    img: "lib/core/assets/image 15.png",
                    title: "Cabai Hidroponik",
                    difficulty: "Sulit",
                    day: "Hari ke-10",
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: const [
                      Text(
                        "Riwayat",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  plantItem(
                    context: context,
                    img: "lib/core/assets/selada.png",
                    title: "Selada Hidroponik",
                    difficulty: "Mudah",
                    day: "Hari ke-15",
                  ),

                  plantItem(
                    context: context,
                    img: "lib/core/assets/bayam.png",
                    title: "Bayam Hidroponik",
                    difficulty: "Mudah",
                    day: "Hari ke-12",
                  ),

                  plantItem(
                    context: context,
                    img: "lib/core/assets/image 15.png",
                    title: "Cabai Hidroponik",
                    difficulty: "Sulit",
                    day: "Hari ke-20",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------
  // METHOD TANPA ERROR LAGI
  // -------------------------
  Widget plantItem({
    required BuildContext context,
    required String img,
    required String title,
    required String difficulty,
    required String day,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              img,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: difficulty == "Sulit" ? Colors.red : Colors.green,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      difficulty,
                      style: TextStyle(
                        fontSize: 13,
                        color: difficulty == "Sulit"
                            ? Colors.red
                            : Colors.green,
                      ),
                    ),
                  ],
                ),
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PantauTanamanScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF38977F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "Pantau",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageBaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Halaman Baru")),
    );
  }
}
