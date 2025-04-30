import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_planner/database_helper.dart';
import 'package:study_planner/home_page.dart';
import 'package:study_planner/prefs.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),

                    children: <InlineSpan>[
                      const TextSpan(text: "Plan "),
                      const TextSpan(text: "for "),
                      WidgetSpan(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightGreenAccent[100],

                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "assignments",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const TextSpan(text: ", "),
                      WidgetSpan(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.purple[100],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "notes",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const TextSpan(text: ", "),
                      const TextSpan(text: "or "),
                      WidgetSpan(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 2.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.pinkAccent[100],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "exams",
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const TextSpan(text: "."),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'We help students stay on track with their studies',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Image.asset(
                    "assets/pngs/Student Studying - Transparent Background.png",
                    height: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.chevron_left_sharp),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 100),
                    SizedBox(
                      width: 140,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return OnboardingPage2();
                              },
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Get Started',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(Icons.chevron_right_sharp),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingPage2 extends StatefulWidget {
  const OnboardingPage2({super.key});

  @override
  State<OnboardingPage2> createState() => _OnboardingPage2State();
}

class _OnboardingPage2State extends State<OnboardingPage2> {
  final TextEditingController _nameController = TextEditingController();
  final Prefs _prefs = Prefs();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 120),
                Text(
                  'Introduce yourself! 🌿',
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Transform.translate(
                          offset: Offset(150, 125),
                          child: Image.asset(
                            "assets/pngs/Peaking - Onboarding Transparent Background.png",
                            height: MediaQuery.of(context).size.height * 0.6,
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, 200),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextField(
                            autocorrect: true,
                            textInputAction: TextInputAction.done,
                            controller: _nameController,
                            decoration: InputDecoration(
                              labelText: 'First Name',
                              border: UnderlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.63,
                          ), //450
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 40,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(Icons.chevron_left_sharp),
                                    style: IconButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.21,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: FilledButton(
                                    onPressed: () {
                                      if (_nameController.text.trim().isEmpty) {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Please enter your first name.',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Colors.black,
                                            behavior: SnackBarBehavior.floating,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                        return;
                                      }

                                      _prefs.nameDuringOnboarding(
                                        _nameController.text.trim(),
                                      );

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return OnboardingPage3(
                                              userName:
                                                  _nameController.text.trim(),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    style: FilledButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Keep Going',
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(Icons.chevron_right_sharp),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingPage3 extends StatefulWidget {
  final String userName;
  const OnboardingPage3({super.key, required this.userName});

  @override
  State<OnboardingPage3> createState() => _OnboardingPage3State();
}

class _OnboardingPage3State extends State<OnboardingPage3> {
  int? selectedAvatarIndex;
  final Prefs _prefs = Prefs();

  final List<String> _avatars = [
    "assets/avatars/Bloop - Transparent Background Resized.png",
    "assets/avatars/Goblin Profile - Transparent Background Resized.png",
    "assets/avatars/Robot Profile - Transparent Background Resized.png",
    "assets/avatars/Slime Profile - Transparent Background Resized.png",
    "assets/avatars/Dragon Profile - Transparent Background Resized.png",
    "assets/avatars/Treant Profile - Transparent Background Resized.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.all(8),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(text: "Hi "),
                    WidgetSpan(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 2.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.lightGreenAccent[100],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Text(
                          widget.userName,
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    TextSpan(text: " 👋"),
                    TextSpan(text: ", "),
                    TextSpan(text: "Pick your Avatar"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: _avatars.length,
                  itemBuilder: (context, index) {
                    final isSelected = (selectedAvatarIndex == index);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedAvatarIndex = index;
                          _prefs.selectedAvatar(
                            _avatars[selectedAvatarIndex as int],
                          );
                        });
                      },
                      child: GridTile(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? Colors.lightBlueAccent
                                          : Colors.transparent,
                                  width: 4,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  _avatars[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (isSelected)
                              Positioned(
                                top: 8,
                                right: 8,
                                child: Icon(
                                  Icons.check_circle_sharp,
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.chevron_left_sharp),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 100),
                    SizedBox(
                      width: 150,
                      child: FilledButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return OnboardingPage4();
                              },
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Almost There',
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(Icons.chevron_right_sharp),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPage4 extends StatefulWidget {
  const OnboardingPage4({super.key});

  @override
  State<OnboardingPage4> createState() => _OnboardingPage4State();
}

class _OnboardingPage4State extends State<OnboardingPage4> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final DatabaseHelper _db = DatabaseHelper();

  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
      duration: const Duration(seconds: 10),
    );
  }

  @override
  void dispose() {
    _userName.dispose();
    _password.dispose();
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Image.asset(
                    "assets/bgs/Organic Wallpaper 3.png",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  Column(
                    children: [
                      SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Let's set your goals in motion.",
                          style: GoogleFonts.poppins(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50),
                            ),
                            color: Colors.white,
                          ),
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 8),
                              Text(
                                'Sign Up',
                                style: GoogleFonts.poppins(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 16),
                              Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: _userName,
                                      decoration: InputDecoration(
                                        label: Text('Username'),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    TextFormField(
                                      controller: _password,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        label: Text('Password'),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                          0.38,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 40,
                                            child: IconButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              icon: Icon(
                                                Icons.chevron_left_sharp,
                                              ),
                                              style: IconButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                foregroundColor: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 100),
                                          SizedBox(
                                            width: 150,
                                            child: FilledButton(
                                              onPressed: () async {
                                                if (_userName.text.isEmpty ||
                                                    _password.text.isEmpty ||
                                                    _password.text.length < 8) {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        "Please enter a username and a password that is at least 8 characters long.",
                                                      ),
                                                      behavior:
                                                          SnackBarBehavior
                                                              .floating,
                                                      margin: EdgeInsets.all(8),
                                                      duration: Duration(
                                                        seconds: 2,
                                                      ),
                                                    ),
                                                  );
                                                  return;
                                                }

                                                if (mounted) {
                                                  setState(() {
                                                    _confettiController.play();
                                                  });
                                                }

                                                if (await _db.insertCredentials(
                                                  _userName.text.trim(),
                                                  _password.text.trim(),
                                                )) {
                                                  Future.delayed(
                                                    Duration(seconds: 4),
                                                    () {
                                                      if (mounted) {
                                                        Navigator.pushAndRemoveUntil(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    HomePage(),
                                                          ),
                                                          (
                                                            Route<dynamic>
                                                            route,
                                                          ) => false,
                                                        );
                                                      }
                                                    },
                                                  );
                                                } else {
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    SnackBar(
                                                      content: Text(
                                                        'Error! Contact Support Team',
                                                        style:
                                                            GoogleFonts.poppins(
                                                              fontSize: 8,
                                                            ),
                                                      ),
                                                      duration: Duration(
                                                        seconds: 2,
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                              style: FilledButton.styleFrom(
                                                backgroundColor: Colors.black,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Submit',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.chevron_right_sharp,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  ConfettiWidget(
                    confettiController: _confettiController,
                    blastDirectionality: BlastDirectionality.explosive,
                    shouldLoop: false,
                    numberOfParticles: 300,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
