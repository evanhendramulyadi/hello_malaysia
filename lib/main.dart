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
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const VideoPopup(videoPath: 'assets/videos/anwar-ibrahim.mp4'),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color navyColor = Color(0xFF012B47);
    const Color kremColor = Color(0xFFF8F0E5);

    return CustomLayout(
      activeIndex: 0, // <--- INI BIAR ICON HOME NYALA BIRU
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
    return AlertDialog(
      backgroundColor: Colors.black,
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_controller.value.isInitialized)
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            else
              const SizedBox(height: 200, child: Center(child: CircularProgressIndicator())),
            Container(
              color: const Color(0xFFC20707),
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "CLOSE",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}