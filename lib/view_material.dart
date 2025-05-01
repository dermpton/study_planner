import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_planner/database_helper.dart';

class ViewMaterialPage extends StatefulWidget {
  final String courseId;
  const ViewMaterialPage({super.key, required this.courseId});

  @override
  State<ViewMaterialPage> createState() => _ViewMaterialPageState();
}

class _ViewMaterialPageState extends State<ViewMaterialPage> {
  List<String> _resources = [];
  final DatabaseHelper _db = DatabaseHelper();

  Future<void> _getRelevantFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'pdf', 'doc'],
      );

      if (result != null && result.files.single.path != null) {
        final path = result.files.single.path!;

        // For debugging
        // print("Selected file: $path");
        // print("Course ID: ${widget.courseId}");

        // Check if the courseId exists in the courses table
        await _db.saveResource(widget.courseId, path);

        // Refresh the list
        _loadResources();

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('File added successfully'),
            backgroundColor: Colors.black,
          ),
        );
      }
    } catch (e) {
      // print("Error adding file: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error adding file: ${e.toString()}'),
          backgroundColor: Colors.black,
        ),
      );
    }
  }

  void _loadResources() async {
    final files = await _db.displayResources(widget.courseId);
    setState(() {
      _resources = files;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.chevron_left_sharp),
            ),
          ),
          SizedBox(height: 16),
          Transform.translate(
            offset: Offset(-110, 0),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: "Dashboard > "),
                  WidgetSpan(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 2.0,
                        horizontal: 8.0,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent[100],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'View Material',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Transform.translate(
            offset: Offset(-100, 0),
            child: Column(
              children: [
                Text(
                  'Material',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Column(
                children: [
                  SizedBox(height: 8),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Positioned.fill(
                              child: Image.asset(
                                'assets/bgs/Organic Wallpaper 2.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.courseId,
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      await _getRelevantFile();
                    },
                    icon: Icon(Icons.add),
                  ),
                  if (_resources.isEmpty)
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/pngs/No Material Yet - Transparent Background.png',
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.width * 0.35,
                        ),
                      ),
                    )
                  else
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          String filename = _resources[index].split('/').last;
                          return ListTile(
                            leading: CircleAvatar(
                              radius: 35,
                              child: Icon(Icons.notes_sharp),
                            ),
                            title: Text(
                              filename,
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () async {
                                showAdaptiveDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: GoogleFonts.poppins(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            if (await _db.deleteResource(
                                              _resources[index],
                                            )) {
                                              setState(() {
                                                _loadResources();
                                              });

                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  backgroundColor: Colors.black,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  duration: Duration(
                                                    seconds: 2,
                                                  ),
                                                  content: Text(
                                                    'Material Removed',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 8,
                                                    ),
                                                  ),
                                                ),
                                              );
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                                Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                            foregroundColor: Colors.white,
                                          ),
                                          child: Text(
                                            'Delete',
                                            style: GoogleFonts.poppins(
                                              fontSize: 8,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                      content: Text(
                                        "Delete ${_resources[index].split('/').last}?",
                                        style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(Icons.delete_sharp),
                            ),
                          );
                        },
                        itemCount: _resources.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
