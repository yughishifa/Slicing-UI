import 'package:flutter/material.dart';
import '../../auth/personalization/clip_path.dart';

// Custom Colors
const Color kBgDark = Color(0xFF0F3836);
const Color _kPrimaryColor = Color(0xFF1E5B4B);
const Color _kAccentGreen = Color(0xFF38977F);
const Color _kLightGreenBg = Color(0xFFE8F5E9);
const Color _kLightRedBg = Color(0xFFFFEBEE);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(statusBarHeight, context),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const _OrderStatusCard(),
                  const SizedBox(height: 16),

                  _MenuItemTile(
                    title: 'Personalisasi',
                    imagePath: 'lib/core/assets/image 4.png',
                    iconColor: _kAccentGreen,
                    iconBgColor: _kLightGreenBg,
                    onTap: () {
                      Navigator.pushNamed(context, "/personalisasi");
                    },
                  ),

                  const SizedBox(height: 12),


                  _MenuItemTile(
                    title: 'Logout',
                    icon: Icons.logout,
                    imagePath: null,
                    iconColor: Colors.red,
                    iconBgColor: _kLightRedBg,
                    onTap: () {},
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(double statusBarHeight, BuildContext context) {
    return Container(
      height: 200 + statusBarHeight,
      width: double.infinity,
      child: Stack(
        children: [
          ClipPath(
            clipper: TopOvalClipper(),
            child: Container(
              height: 200 + statusBarHeight,
              width: double.infinity,
              color: kBgDark,
            ),
          ),

          Positioned(
            top: statusBarHeight + 20,
            left: 20,
            right: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 40, color: Colors.grey),
                ),

                const SizedBox(width: 15),

                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mellafesa',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'mellafesaa@gmail.com',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/personalisasi');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _kAccentGreen,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  ),
                  child: const Text(
                    'Edit Profil',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _OrderStatusCard extends StatelessWidget {
  const _OrderStatusCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Status Pesanan Marketplace',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatusItem(Icons.inventory_2_outlined, 'Diproses'),
                _buildStatusItem(Icons.local_shipping_outlined, 'Dikirim'),
                _buildStatusItem(Icons.star_border_outlined, 'Selesai'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _kAccentGreen,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label,
            style:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _MenuItemTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final String? imagePath;
  final Color iconColor;
  final Color iconBgColor;
  final VoidCallback? onTap;

  const _MenuItemTile({
    required this.title,
    this.icon,
    this.imagePath,
    required this.iconColor,
    required this.iconBgColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: imagePath != null
                    ? Image.asset(
                        imagePath!,
                        height: 26,
                        width: 26,
                      )
                    : Icon(icon, color: iconColor, size: 24),
              ),

              const SizedBox(width: 16),

              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: iconColor == Colors.red ? Colors.red : Colors.black87,
                ),
              ),

              const Spacer(),

              Icon(Icons.arrow_forward_ios, color: iconColor, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
