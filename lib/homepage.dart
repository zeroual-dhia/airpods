import 'package:airpods/airpodsmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Airpodsmodel airpodModel = Provider.of<Airpodsmodel>(context);

    return Scaffold(
      body: AnimatedContainer(
        height: double.infinity,
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: airpodModel.airpods[airpodModel.currentIndex]['gradient'],
          ),
        ),
        child: Stack(
          children: [
            // Floating airpod pieces in background
            Positioned(
              top: 50,
              left: 20,
              child: Opacity(
                opacity: 0.1,
                child: Transform.rotate(
                  angle: -0.3,
                  child: Image.asset(
                    airpodModel.airpods[airpodModel.currentIndex]['url'],
                    width: 80,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              right: 30,
              child: Opacity(
                opacity: 0.15,
                child: Transform.rotate(
                  angle: 0.5,
                  child: Image.asset(
                    airpodModel.airpods[airpodModel.currentIndex]['url'],
                    width: 100,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 200,
              left: 40,
              child: Opacity(
                opacity: 0.08,
                child: Transform.rotate(
                  angle: 0.8,
                  child: Image.asset(
                    airpodModel.airpods[airpodModel.currentIndex]['url'],
                    width: 120,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              right: 20,
              child: Opacity(
                opacity: 0.12,
                child: Transform.rotate(
                  angle: -0.6,
                  child: Image.asset(
                    airpodModel.airpods[airpodModel.currentIndex]['url'],
                    width: 90,
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: 10,
              child: Opacity(
                opacity: 0.1,
                child: Transform.rotate(
                  angle: 1.2,
                  child: Image.asset(
                    airpodModel.airpods[airpodModel.currentIndex]['url'],
                    width: 70,
                  ),
                ),
              ),
            ),
            // Main content
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: airpodModel.airpods.length,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      airpodModel.setIndex(index);
                    },
                    itemBuilder: (context, index) {
                      return AnimtedAirpod(airpod: airpodModel.airpods[index]);
                    },
                  ),
                ),
                Flexible(
                  child: InkWell(
                    onTap: () {
                      context.push('/details');
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 13,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: airpodModel
                              .airpods[airpodModel.currentIndex]['gradient'],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            blurRadius: 8,
                            spreadRadius: 2,
                            color:
                                airpodModel.airpods[airpodModel
                                    .currentIndex]['gradient'][0],
                          ),
                        ],
                      ),
                      child: Text(
                        'View Details',
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: airpodModel
                              .airpods[airpodModel.currentIndex]['color'],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimtedAirpod extends StatefulWidget {
  const AnimtedAirpod({super.key, required this.airpod});
  final Map<String, dynamic> airpod;

  @override
  State<AnimtedAirpod> createState() => _AnimtedAirpodState();
}

class _AnimtedAirpodState extends State<AnimtedAirpod>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            textAlign: TextAlign.center,
            widget.airpod['name'],
            style: GoogleFonts.orbitron(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: TweenAnimationBuilder(
            curve: Curves.slowMiddle,
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(milliseconds: 600),
            builder: (context, value, child) {
              return Hero(
                tag: widget.airpod['name'],
                child: Image.asset(widget.airpod['url'], width: 300 * value),
              );
            },
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }
}
