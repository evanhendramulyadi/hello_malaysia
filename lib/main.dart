import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'widgets/custom_layout.dart';
import 'culture_page.dart';
import 'tourism.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showVideoPopup();
    });
  }

  void _showVideoPopup() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Video",
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, anim1, anim2) => const VideoPopup(videoPath: 'assets/videos/anwar-ibrahim.mp4'),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
    ).then((_) {
      if (mounted) {
        Future.delayed(const Duration(milliseconds: 100), () {
          _showQRPopup();
        });
      }
    });
  }

  void _showQRPopup() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "QR",
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, anim1, anim2) => const QRPopup(imagePath: 'assets/images/qr-code-ebook.jpeg'),
      transitionBuilder: (context, anim1, anim2, child) {
        return FadeTransition(opacity: anim1, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color navyColor = Color(0xFF012B47);
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 0, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset('assets/images/welcome-screen.png', width: double.infinity, fit: BoxFit.fitWidth),
                Positioned(
                  bottom: 22,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(
                        context: context,
                        label: 'Explore Tourism',
                        icon: Icons.explore_outlined,
                        bgColor: navyColor,
                        textColor: kremColor,
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TourismPage())),
                      ),
                      const SizedBox(width: 15),
                      _buildButton(
                        context: context,
                        label: 'Discover Culture',
                        icon: Icons.museum_outlined,
                        bgColor: Colors.transparent,
                        textColor: kremColor,
                        isOutlined: true,
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CulturePage())),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Image.asset('assets/images/story-full.png', width: double.infinity, fit: BoxFit.fitWidth),
            Image.asset('assets/images/culture-malaysia.png', width: double.infinity, fit: BoxFit.fitWidth),
            const SizedBox(height: 25),
            Image.asset('assets/images/geo-culiner-1.png', width: double.infinity, fit: BoxFit.fitWidth),
            Image.asset('assets/images/geo-culiner-2.png', width: double.infinity, fit: BoxFit.fitWidth),
            const SizedBox(height: 25),
            Image.asset('assets/images/inspiring-figures.png', width: double.infinity, fit: BoxFit.fitWidth),
            Image.asset('assets/images/nation-diversity.png', width: double.infinity, fit: BoxFit.fitWidth),
            Image.asset('assets/images/story-about-us.png', width: double.infinity, fit: BoxFit.fitWidth),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required BuildContext context, required String label, required IconData icon, required Color bgColor, required Color textColor, required VoidCallback onPressed, bool isOutlined = false}) {
    return SizedBox(
      width: 135,
      height: 38,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          elevation: isOutlined ? 0 : 5,
          side: isOutlined ? BorderSide(color: textColor, width: 2) : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 5),
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ),
    );
  }
}



// --- WIDGET POPUP VIDEO ---
class VideoPopup extends StatefulWidget {
  final String videoPath;
  const VideoPopup({super.key, required this.videoPath});

  @override
  State<VideoPopup> createState() => _VideoPopupState();
}

class _VideoPopupState extends State<VideoPopup> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        setState(() {});
        _controller.setLooping(true);
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Membungkus video ke dalam struktur 9:16
    return _BasePopupStructure(
      child: _controller.value.isInitialized
          ? VideoPlayer(_controller)
          : const Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}

// --- WIDGET POPUP QR ---
class QRPopup extends StatelessWidget {
  final String imagePath;
  const QRPopup({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // Membungkus gambar ke dalam struktur 9:16
    return _BasePopupStructure(
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover, // Memaksa gambar memenuhi kotak 9:16
      ),
    );
  }
}

// --- LOGIKA PEMBUNGKUS (UKURAN FIX 9:16) ---
class _BasePopupStructure extends StatelessWidget {
  final Widget child;
  const _BasePopupStructure({required this.child});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    // Tentukan LEBAR kotak (70% lebar layar agar ada ruang di pinggir)
    final double dialogWidth = screenWidth * 0.7; 
    
    // RUMUS 9:16 -> Tinggi = (Lebar / 9) * 16
    final double contentHeight = (dialogWidth / 9) * 16;

    // Proteksi: Jika HP terlalu pendek, kita kecilkan skalanya agar tombol Close tidak hilang
    double finalWidth = dialogWidth;
    double finalHeight = contentHeight;
    
    if (finalHeight > screenHeight * 0.7) {
      finalHeight = screenHeight * 0.7;
      finalWidth = (finalHeight / 16) * 9;
    }

    return AlertDialog(
      backgroundColor: Colors.transparent, 
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: Container(
        width: finalWidth,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // KOTAK KONTEN 9:16
              SizedBox(
                width: finalWidth,
                height: finalHeight,
                child: child,
              ),
              // TOMBOL CLOSE (TIDAK MASUK HITUNGAN 9:16 BIAR KONTEN TETAP PAS)
              Container(
                width: finalWidth,
                height: 50,
                color: const Color(0xFFC20707),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "CLOSE",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}