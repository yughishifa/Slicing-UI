import 'package:flutter/material.dart';
import 'clip_path.dart';

class SurveyScreen3 extends StatefulWidget {
  const SurveyScreen3({super.key});

  @override
  State<SurveyScreen3> createState() => _SurveyScreen3State(); 
}


class _SurveyScreen3State extends State<SurveyScreen3> {
  static const Color _headerColor = Color(0xFF0F3836);
  static const Color _primaryGreen = Color(0xFF00C853);

  final Map<String, bool> _selectedPlantTypes = {
    'Sayuran daun (misalnya selada, bayam)': false,
    'Buah (misalnya tomat, stroberi)': false,
    'Tanaman herbal': false,
    'Belum tahu / ingin rekomendasi': false,
  };

  String? _selectedTime;
  final List<String> timeOptions = [
    '< 10 menit',
    '10-30 menit',
    '> 30 menit',
  ];

  String? _selectedLocation;
  final List<String> locationOptions = [
    'Dalam ruangan',
    'Luar ruangan',
    'Balkon atau teras',
  ];

  bool get _isComplete {
    final bool isPlantTypeSelected = _selectedPlantTypes.values.any((isSelected) => isSelected);
    final bool isTimeSelected = _selectedTime != null;
    final bool isLocationSelected = _selectedLocation != null;
    
    return isPlantTypeSelected && isTimeSelected && isLocationSelected;
  }

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
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(), 
      ),
      title: const Text(
        '3/3', 
        style: TextStyle(color: Colors.white70, fontSize: 14),
      ),
      centerTitle: false,
      actions: [
        TextButton(
          onPressed: () {
            // Logika Lewati: biasanya menavigasi ke Home/Login
          },
          child: const Text(
            'Lewati',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 8.0),
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),

              _buildCheckboxQuestionCard(
                question: 'Jenis tanaman apa saja yang ingin kamu tanam?',
                options: _selectedPlantTypes,
                onChanged: (option, isChecked) {
                  setState(() {
                    _selectedPlantTypes[option] = isChecked;
                  });
                },
              ),

              const SizedBox(height: 20),

              _buildRadioQuestionCard(
                question: 'Berapa waktu yang bisa diluangkan per hari untuk merawat tanaman?',
                options: timeOptions,
                groupValue: _selectedTime,
                onChanged: (String? value) {
                  setState(() {
                    _selectedTime = value;
                  });
                },
              ),
              
              const SizedBox(height: 20),

              _buildRadioQuestionCard(
                question: 'Dimana kamu akan menanam tanaman hidroponik?',
                options: locationOptions,
                groupValue: _selectedLocation,
                onChanged: (String? value) {
                  setState(() {
                    _selectedLocation = value;
                  });
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxQuestionCard({
    required String question,
    required Map<String, bool> options,
    required Function(String, bool) onChanged,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4, 
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildQuestionHeader(question),
            ...options.keys.map((option) => CheckboxListTile(
                  title: Text(option),
                  value: options[option],
                  onChanged: (bool? value) {
                    if (value != null) {
                      onChanged(option, value);
                    }
                  },
                  activeColor: _primaryGreen,
                  controlAffinity: ListTileControlAffinity.leading, 
                )).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioQuestionCard({
    required String question,
    required List<String> options,
    required String? groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4, 
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildQuestionHeader(question),
            ...options.map((option) => RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: groupValue,
                  onChanged: onChanged,
                  activeColor: _primaryGreen,
                )).toList(),
          ],
        ),
      ),
    );
  }

 Widget _buildQuestionHeader(String question) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'lib/core/assets/image 4.png',
          width: 30,
          height: 30,
        ),

        const SizedBox(width: 8),

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
  );
}


  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ElevatedButton(
        onPressed: _isComplete
            ? () {
                Navigator.of(context).pushReplacementNamed('/homepage'); 
              }
            : null, 
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryGreen,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          disabledBackgroundColor: Colors.grey.shade300, 
          disabledForegroundColor: Colors.white,
        ),
        child: const Text(
          'Selesai', 
          style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}