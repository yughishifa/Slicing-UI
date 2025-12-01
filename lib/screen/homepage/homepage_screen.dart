import 'package:flutter/material.dart';
import '../auth/personalization/clip_path.dart';
import '../homepage/marketplace/marketplace_screen.dart';
import '../homepage/pantau_tanaman/pantau_screen.dart';
import '../homepage/profile/profile_screen.dart';

const Color kBgDark = Color(0xFF0F3836);
const Color kPrimaryGreen = Color(0xFF459489);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  
  final List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages.addAll([
      _buildHomePage(),
      const PantauScreen(),
      const MarketplaceScreen(),
      const ProfileScreen(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],   

     
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, -2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              icon: Icons.home,
              label: "Beranda",
              index: 0,
            ),
            _navItem(
              icon: Icons.spa,
              label: "Pantau",
              index: 1,
            ),
            _navItem(
              icon: Icons.shopping_bag,
              label: "Market",
              index: 2,
            ),
            _navItem(
              icon: Icons.person,
              label: "Profil",
              index: 3,
            ),
          ],
        ),
      ),
    );
  }

  
  Widget _navItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    bool isActive = _currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 26,
            color: isActive ? kPrimaryGreen : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: isActive ? kPrimaryGreen : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

 
  Widget _buildHomePage() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: TopOvalClipper(),
            child: Container(
              height: 200,
              color: kBgDark,
            ),
          ),
        ),

        SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              const SizedBox(height: 24),
              _buildProgressCard(),
              const SizedBox(height: 24),
              _buildSearchBar(),
              const SizedBox(height: 24),
              Expanded(child: _buildRecommendationSection()),
            ],
          ),
        ),
      ],
    );
  }

 
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Halo Mellafesa! 👋',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Berkebun Apa Hari Ini?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 48.0,
            height: 48.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5),
            ),
            child: const Center(
              child: Text(
                '👧',
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildProgressCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Card(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Belum Ada Progress\nTanaman Hari Ini...',
                      style: TextStyle(
                        color: kBgDark,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Ayo pilih tanaman pertama kamu\ndan mulai tanam sekarang!',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Image.asset(
                'lib/core/assets/freepik--Tree--inject-3.png',
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

 
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 160, 147, 147).withOpacity(0.15),
          hintText: 'Cari tanaman...',
          prefixIcon: Icon(Icons.search, color: Colors.grey[700]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  
  Widget _buildRecommendationSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Rekomendasi Untukmu",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                "Lihat Semua",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: kPrimaryGreen,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.90,
              ),
              itemCount: _plants.length,
              itemBuilder: (context, index) {
                final p = _plants[index];
                return _buildPlantCard(
                  p['image'],
                  p['name'],
                  p['level'],
                  p['duration'],
                  p['levelColor'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  
  Widget _buildPlantCard(
    String image,
    String name,
    String level,
    String duration,
    Color levelColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle, size: 10, color: levelColor),
                        const SizedBox(width: 4),
                        Text(
                          level,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Icon(
                          Icons.timer_outlined,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          duration,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


List<Map<String, dynamic>> _plants = [
  {
    "image": "lib/core/assets/selada.png",
    "name": "Selada Hidroponik",
    "level": "Mudah",
    "duration": "3–5 Ming",
    "levelColor": Colors.green,
  },
  {
    "image": "lib/core/assets/bayam.png",
    "name": "Bayam Hidroponik",
    "level": "Mudah",
    "duration": "3–4 Ming",
    "levelColor": Colors.green,
  },
  {
    "image": "lib/core/assets/pakcoy.png",
    "name": "Pakcoy Hidroponik",
    "level": "Mudah",
    "duration": "5–6 Ming",
    "levelColor": Colors.green,
  },
  {
    "image": "lib/core/assets/tomat.png",
    "name": "Tomat Cherry",
    "level": "Sedang",
    "duration": "8–10 Ming",
    "levelColor": Colors.orange,
  },
  {
    "image": "lib/core/assets/seledri.png",
    "name": "Seledri Hidroponik",
    "level": "Sedang",
    "duration": "5–6 Ming",
    "levelColor": Colors.orange,
  },
  {
    "image": "lib/core/assets/stroberi.png",
    "name": "Stroberi Hidroponik",
    "level": "Sulit",
    "duration": "12–16 Ming",
    "levelColor": Colors.red,
  },
];
