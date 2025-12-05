import 'package:flutter/material.dart';
import '../../auth/personalization/clip_path.dart';

// Gambar header tanaman
const String _imagePath = 'lib/core/assets/pakcoy.png';

class PantauTanamanScreen extends StatelessWidget {
  const PantauTanamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pantau Tanaman',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeaderImage(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 20),

                  const Text(
                    'Selada Hidroponik',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),
                  Row(
                    children: const <Widget>[
                      Icon(Icons.circle, color: Colors.green, size: 12),
                      SizedBox(width: 4),
                      Text(
                        'Mudah',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.eco_rounded, color: Colors.green, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Hari ke-1',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  _buildProgressCard(),
                ],
              ),
            ),

            const SizedBox(height: 20),
            _buildDaySelection(),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: _buildTaskAndTipsBox(),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildBannerHydropome(),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildBottomButtons(),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ---------------------------
  // HEADER IMAGE
  // ---------------------------
  Widget _buildHeaderImage() {
    return ClipPath(
      clipper: TopOvalClipper(),
      child: AspectRatio(
        aspectRatio: 1.5,
        child: Image.asset(
          _imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // ---------------------------
  // PROGRESS CARD
  // ---------------------------
  Widget _buildProgressCard() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Progres Menanam',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Ayo mulai menanam!',
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 8),

                LinearProgressIndicator(
                  value: 0.0,
                  backgroundColor: Colors.grey.shade300,
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Colors.orange),
                  minHeight: 5,
                ),

                const SizedBox(height: 4),
                const Text(
                  '0% Selesai',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.orange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          Image.asset(
            "lib/core/assets/freepik--Tree--inject-3.png",
            width: 60,
            height: 60,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  // ---------------------------
  // DAY SELECTION
  // ---------------------------
  Widget _buildDaySelection() {
    return SizedBox(
      height: 60,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          _buildDayButton('Hari 01', true),
          _buildDayButton('Hari 02', false),
          _buildDayButton('Hari 03', false),
          _buildDayButton('Hari 04', false),
          _buildDayButton('Hari 05', false),
          _buildDayButton('Hari 06', false),
          _buildDayButton('Hari 07', false),
        ],
      ),
    );
  }

  Widget _buildDayButton(String text, bool isActive) {
    return Container(
      width: 60,
      margin: const EdgeInsets.only(right: 12),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1E88E5) : const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        text.replaceAll(' ', '\n'),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black87,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }

  // ---------------------------
  // TASK + TIPS BOX
  // ---------------------------
  Widget _buildTaskItem(String label, bool isDone, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              border: Border.all(
                color: isDone ? Colors.transparent : Colors.grey,
                width: 1.5,
              ),
              color: isDone ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: isDone
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),

          const SizedBox(width: 12),

          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              decoration: isDone ? TextDecoration.lineThrough : null,
              color: isDone ? Colors.grey : Colors.black,
            ),
          ),

          if (icon != null) ...[
            const SizedBox(width: 8),
            Icon(icon, color: Colors.green, size: 16),
          ],
        ],
      ),
    );
  }

  Widget _buildTaskAndTipsBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.28),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: const <Widget>[
              Icon(Icons.rocket_launch, color: Colors.red, size: 24),
              SizedBox(width: 8),
              Text(
                'Tugas Hari ke-1',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 10),

          _buildTaskItem('Siapkan Nutrisi & Air', true,
              icon: Icons.edit_note_rounded),
          _buildTaskItem('Rendam Rockwool', false, icon: Icons.grass_rounded),
          _buildTaskItem('Tanam Benih Selada', false, icon: Icons.spa_rounded),
          _buildTaskItem('Tutup & Simpan', false, icon: Icons.archive_rounded),

          const SizedBox(height: 20),

          Row(
            children: const <Widget>[
              Icon(Icons.auto_fix_high, color: Colors.green, size: 24),
              SizedBox(width: 8),
              Text(
                'Tips Hari Ini:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          const SizedBox(height: 8),
          const Text(
            "Gunakan air bersih dan pastikan rockwool lembap merata untuk hasil terbaik.",
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------
  // BANNER
  // ---------------------------
  Widget _buildBannerHydropome() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage("lib/core/assets/Banner iklan marketplace.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.all(20),
      height: 150,
    );
  }

  // ---------------------------
  // BOTTOM BUTTONS
  // ---------------------------
  Widget _buildBottomButtons() {
    return Column(
      children: [
        // Tombol Lihat Panduan
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: Color(0xFF1E9F8C), width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Lihat Panduan",
              style: TextStyle(
                color: Color(0xFF1E9F8C),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // Tombol Hari ke-1 Selesai
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1E9F8C),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Hari ke-1 Selesai",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
