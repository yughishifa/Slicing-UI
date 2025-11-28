import 'package:flutter/material.dart';
import 'package:hydropome/views/clip_path.dart';


class SurveryScreen extends StatelessWidget {
  const SurveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HydroPomeQuizScreen();
  }
}

class HydroPomeQuizScreen extends StatefulWidget {
  const HydroPomeQuizScreen({super.key});

  @override
  State<HydroPomeQuizScreen> createState() => _HydroPomeQuizScreenState();
}

class _HydroPomeQuizScreenState extends State<HydroPomeQuizScreen> {
  static const Color _headerColor = Color(0xFF0F3836);
  static const Color _primaryGreen = Color(0xFF00C853);

  String? _selectedExperience;
  final List<String> experienceOptions = [
    'Belum pernah',
    'Pernah, tapi masih pemula',
    'Sudah cukup berpengalaman',
  ];

  String? _selectedGoal;
  final List<String> goalOptions = [
    'Belajar hidroponik dari awal',
    'Merawat tanaman hidroponik yang sudah ada',
    'Membeli peralatan dan perlengkapan hidroponik',
    'Menjual hasil panen',
  ];

  bool get _isComplete => _selectedExperience != null && _selectedGoal != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomButton(context),
    );
  }

  
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: _headerColor,
      
      elevation: 0,
      leading: IconButton(
        icon:Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: const Text(
        '1/3',
        style: TextStyle(color: Colors.white70, fontSize: 14),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/homepage');
          },
          child: const Text(
            'Lewati',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

 
  Widget _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: ClipPath(
            clipper: TopOvalClipper(),
            child: Container(
              height: 160,
              color: _headerColor,
            ),
          ),
        ),

        SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Yuk Jawab Biar HydroPoMe Tahu Kebutuhanmu 🌱',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 30),

             
              _buildQuestionCard(
                question: 'Apakah kamu pernah mencoba menanam hidroponik sebelumnya?',
                iconPath: 'assets/images/images4.png',
                options: experienceOptions,
                groupValue: _selectedExperience,
                onChanged: (value) {
                  setState(() => _selectedExperience = value);
                },
              ),

              const SizedBox(height: 20),

              
              _buildQuestionCard(
                question: 'Apa tujuan utama kamu menggunakan aplikasi HydroPoMe?',
                iconPath: 'assets/images/images4.png',
                options: goalOptions,
                groupValue: _selectedGoal,
                onChanged: (value) {
                  setState(() => _selectedGoal = value);
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  
  Widget _buildQuestionCard({
    required String question,
    required String iconPath,
    required List<String> options,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Image.asset(
                  iconPath,
                  width: 28,
                  height: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    question,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            ...options.map((option) {
              return RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: _primaryGreen,
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

 
  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ElevatedButton(
        onPressed: _isComplete
            ? () {
                Navigator.of(context).pushReplacementNamed('/survey2');
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryGreen,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBackgroundColor: Colors.grey.shade300,
          disabledForegroundColor: Colors.grey.shade600,
        ),
        child: const Text(
          'Selanjutnya',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}