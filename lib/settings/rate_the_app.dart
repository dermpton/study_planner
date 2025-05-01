import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RateTheAppPage extends StatefulWidget {
  const RateTheAppPage({super.key});

  @override
  State<RateTheAppPage> createState() => _RateTheAppPageState();
}

class _RateTheAppPageState extends State<RateTheAppPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
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
                      TextSpan(text: "Settings > "),
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
                            'Rate the App',
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
                      'Rate the App',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHigh,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return null;
                  },
                  itemCount: 1,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
