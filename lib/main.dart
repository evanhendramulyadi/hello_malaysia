import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'widgets/custom_layout.dart';
import 'culture_page.dart';
import 'tourism.dart';
import 'package:flutter/services.dart';

// ROOT CAUSE FIX: Add a global flag here to track whether the popup has already been shown.
// This variable is placed outside the class so its value persists in application memory as long as it is not fully closed.
bool _hasShownVideoPopup = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
      // CHECK STATUS FLAG: Only display if popup has NOT been shown before
      if (!_hasShownVideoPopup) {
        _showVideoPopup();
        _hasShownVideoPopup =
            true; // Set value to true so it does not appear again
      }
    });
  }

  void _showVideoPopup() {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Video",
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (context, anim1, anim2) =>
          const VideoPopup(videoPath: 'assets/videos/anwar-ibrahim.mp4'),
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
                Image.asset(
                  'assets/images/welcome-screen.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
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
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TourismPage(),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      _buildButton(
                        context: context,
                        label: 'Discover Culture',
                        icon: Icons.museum_outlined,
                        bgColor: Colors.transparent,
                        textColor: kremColor,
                        isOutlined: true,
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CulturePage(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            Image.asset(
              'assets/images/story-full.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/images/culture-malaysia.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 25),
            Image.asset(
              'assets/images/geo-culinary-1.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/images/geo-culinary-2.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 25),
            Image.asset(
              'assets/images/inspiring-figures.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/images/nation-diversity.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            Image.asset(
              'assets/images/story-about-us.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String label,
    required IconData icon,
    required Color bgColor,
    required Color textColor,
    required VoidCallback onPressed,
    bool isOutlined = false,
  }) {
    return SizedBox(
      width: 135,
      height: 38,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          elevation: isOutlined ? 0 : 5,
          side: isOutlined
              ? BorderSide(color: textColor, width: 2)
              : BorderSide.none,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 5),
        ),
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// --- VIDEO POPUP WIDGET ---
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
    return _BasePopupStructure(
      child: _controller.value.isInitialized
          ? VideoPlayer(_controller)
          : const Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}

// --- QR POPUP WIDGET ---
class QRPopup extends StatelessWidget {
  final String imagePath;
  const QRPopup({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return _BasePopupStructure(
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}

// --- WRAPPER LOGIC (FIXED 9:16 ASPECT RATIO) ---
class _BasePopupStructure extends StatelessWidget {
  final Widget child;
  const _BasePopupStructure({required this.child});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double dialogWidth = screenWidth * 0.7;
    final double contentHeight = (dialogWidth / 9) * 16;

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
              SizedBox(width: finalWidth, height: finalHeight, child: child),
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
