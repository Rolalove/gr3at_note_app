import 'package:flutter/material.dart';
import 'package:gr3at_note_app/screens/newnote_popup_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => NewNotePopupPage(),
            );
          },
          backgroundColor: const Color(0xFF3D8BFF), //change
          elevation: 6,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 32, color: Colors.white),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        body: SafeArea(
          child: Column(
            children: [
              // Top area with diagonal/curved cut on the left-bottom
              ClipPath(
                clipper: TopBarLeftBottomCurveClipper(),
                child: Container(
                  height: 220,
                  color: const Color.fromARGB(255, 217, 245, 248),
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title + subtitle
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'My Notes',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 12),
                                Text(
                                  'Your daily notes that reminds you',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black45,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Search field
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 247, 247, 248),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color.fromARGB(115, 39, 39, 39),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // filler for the rest of the page
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}

/// Clipper that creates a rounded concave cut at the left-bottom corner.
/// Tweak notchDepth and startCurveX to adjust depth and angle.
class TopBarLeftBottomCurveClipper extends CustomClipper<Path> {
  const TopBarLeftBottomCurveClipper();

  @override
  Path getClip(Size size) {
    final Path path = Path();

    // go along the top edge
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // down the right edge to bottom-right
    path.lineTo(size.width, size.height);

    // move left along bottom to where the curve starts (startCurveX)
    final double startCurveX =
        size.width *
        0.22; // move this toward 0 to make notch start closer to left
    path.lineTo(startCurveX, size.height);

    // parameters controlling the notch shape
    final double notchDepth =
        size.height * 0.20; // how high the notch cuts up from the bottom
    // control points for a smooth inward curve
    final double c1x = size.width * 0.12;
    final double c1y = size.height - notchDepth * 0.08;
    final double c2x = size.width * 0.01;
    final double c2y = size.height - notchDepth * 1.05;

    // cubic bezier from bottom (startCurveX, height) to left edge at (0, height - notchDepth)
    path.cubicTo(c1x, c1y, c2x, c2y, 0, size.height - notchDepth);

    // up to the top-left and close
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
