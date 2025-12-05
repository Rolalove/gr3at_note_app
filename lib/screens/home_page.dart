import 'package:flutter/material.dart';
import 'package:gr3at_note_app/screens/newnote_popup_page.dart';
import 'package:gr3at_note_app/widgets/bottom_left_curve_clipper.dart';

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
          backgroundColor: const Color(0xFF3D8BFF),
          elevation: 6,
          shape: const CircleBorder(),
          child: const Icon(Icons.add, size: 32, color: Colors.white),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

        body: SafeArea(
          child: Column(
            children: [
              // Top area with curve at the bottom-left corner
              ClipPath(
                clipper: BottomLeftCurveClipper(),
                child: Container(
                  height: 220,
                  // color: const Color.fromARGB(255, 217, 245, 248),
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
              Expanded(
                child: Container(
                  //work on the note display wiget and display it here, we can use list view
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
