import 'package:airpods/airpodsmodel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _textAnimaiton;
  late Animation<Offset> _priceRateAnimation;
  late Animation<Offset> _specificAnimation;
  late Animation<double> _buttoAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      
      duration: Duration(milliseconds: 2500),
    );
    _textAnimaiton = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.25)));

    _priceRateAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.25, 0.5, curve: Curves.easeInQuad),
          ),
        );

    _specificAnimation = Tween<Offset>(begin: Offset(1, 0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(0.5, 0.75, curve: Curves.decelerate),
          ),
        );

    _buttoAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Interval(0.75, 1)));

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Airpodsmodel airpodModel = Provider.of<Airpodsmodel>(context);
    final airpod = airpodModel.airpods[airpodModel.currentIndex];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: airpod['gradient'],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 50,
              left: 20,
              child: Opacity(
                opacity: 0.1,
                child: Transform.rotate(
                  angle: -0.3,
                  child: Image.asset(airpod['url'], width: 80),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 30,
              child: Opacity(
                opacity: 0.15,
                child: Transform.rotate(
                  angle: 0.5,
                  child: Image.asset(airpod['url'], width: 100),
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
                  child: Image.asset(airpod['url'], width: 90),
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
                  child: Image.asset(airpod['url'], width: 70),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 30,
              child: Opacity(
                opacity: 0.1,
                child: Transform.rotate(
                  angle: 1.2,
                  child: Image.asset(airpod['url'], width: 70),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  color: Colors.white,
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                Flexible(
                  child: Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: airpod['name'],
                      child: Image.asset(airpod['url'], width: 300),
                    ),
                  ),
                ),
                SizedBox(height: 80),
                AnimatedBuilder(
                  animation: _textAnimaiton,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _textAnimaiton.value * 300,
                      child: child,
                    );
                  },
                  child: Text(
                    airpod['name'],
                    style: GoogleFonts.orbitron(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AnimatedBuilder(
                  animation: _textAnimaiton,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _textAnimaiton.value * 400,
                      child: child,
                    );
                  },
                  child: Text(
                    airpod['description'],
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),

                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AnimatedBuilder(
                      animation: _priceRateAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: _priceRateAnimation.value * -200,
                          child: child,
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha(180),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber),
                            SizedBox(width: 5),
                            Text(
                              airpod['rating'].toString(),
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              '(${airpod['reviews']})',
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _priceRateAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: _priceRateAnimation.value * 200,
                          child: child,
                        );
                      },
                      child: Text(
                        '${airpod['price']} DA',
                        style: GoogleFonts.inter(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                AnimatedBuilder(
                  animation: _specificAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _specificAnimation.value * 600,
                      child: child,
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      color: airpod['gradient'][1],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Specifications:",
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.battery_charging_full,
                                        color: Colors.green,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        "Battery Life",
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    airpod['specifications']['Battery Life'],
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.noise_aware),
                                      SizedBox(width: 8),
                                      Text(
                                        "Noise Cancellation",
                                        style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    airpod['specifications']['Noise Cancellation'],
                                    style: GoogleFonts.inter(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40),
                AnimatedBuilder(
                  animation: _buttoAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _buttoAnimation.value,
                      child: child,
                    );
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      splashColor: airpod['gradient'][0].withOpacity(0.3),
                      highlightColor: airpod['gradient'][0].withOpacity(0.2),
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 13,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: airpod['gradient'],
                          ),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(1, 1),
                              blurRadius: 8,
                              spreadRadius: 2,
                              color: airpod['gradient'][0],
                            ),
                          ],
                        ),
                        child: Text(
                          'Order now',
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: airpod['color'],
                          ),
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
