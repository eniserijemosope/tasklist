// import 'package:flutter/material.dart';
// void main (List<String> args){
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       debugShowCheckedModeBanner: false,
//        home: const WaterAnimation()
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const WaterTrackerApp());
}
class Cloud extends StatelessWidget {
  const Cloud({
    super.key,
    required this.size,
  });

  final double size;

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size * 0.5,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: size,
            height: size * 0.25,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(size),
            ),
          ),
          Positioned(
            left: size * 0.15,
            bottom: size * 0.08,
            child: Container(
              width: size * 0.35,
              height: size * 0.35,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: size * 0.15,
            bottom: size * 0.06,
            child: Container(
              width: size * 0.45,
              height: size * 0.45,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Water Tracker',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFE5F1FF),
      ),
      home: const WaterTrackerPage(),
    );
  }
}

class WaterTrackerPage extends StatefulWidget {
  const WaterTrackerPage({super.key});

  @override
  State<WaterTrackerPage> createState() => _WaterTrackerPageState();
}

class _WaterTrackerPageState extends State<WaterTrackerPage> {
  int currentWater = 24;
  final int dailyGoal = 73;

  double get progress {
    if (dailyGoal == 0) return 0;

    return (currentWater / dailyGoal).clamp(0.0, 1.0);
  }

  Future<void> showAddWaterSheet() async {
    final int? amount = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.28),
      builder: (context) {
        return const AddWaterSheet();
      },
    );

    if (amount != null && amount > 0) {
      setState(() {
        currentWater += amount;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: const Color(0xFF174F93),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
        child: Stack(
          children: [
            const Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFD3E7FF),
                      Color(0xFFEAF4FF),
                      Color(0xFFD4E8FF),
                    ],
                  ),
                ),
              ),
            ),

            // Clouds
            const Positioned(
              top: 150,
              left: -20,
              child: Cloud(size: 95),
            ),
            const Positioned(
              top: 170,
              left: 235,
              child: Cloud(size: 110),
            ),
            const Positioned(
              top: 135,
              right: -15,
              child: Cloud(size: 115),
            ),

            // Water level behind the page content.
            // Positioned.fill(
            //   child: CustomPaint(
            //     painter: WaterBackgroundPainter(progress: progress),
            //   ),
            // ),

            SafeArea(
              child: Column(
                children: [
                  _buildHeader(),

                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 150),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '$currentWater/${dailyGoal}oz',
                                style: const TextStyle(
                                  fontSize: 52,
                                  height: 1,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -2,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              'Water intake & your goal',
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  _buildBottomControls(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 12, 24, 0),
      child: SizedBox(
        height: 62,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Text(
              'Today',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.maybePop(context);
                },
                icon: const Icon(
                  Icons.close,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomControls() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 0, 40, 38),
      child: Row(
        children: [
          RoundBlackButton(
            icon: Icons.settings,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Settings button pressed'),
                ),
              );
            },
          ),
          const SizedBox(width: 14),
          Expanded(
            child: SizedBox(
              height: 82,
              child: FilledButton.icon(
                onPressed: showAddWaterSheet,
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36),
                  ),
                ),
                icon: const Icon(
                  Icons.add,
                  size: 31,
                  weight: 800,
                ),
                label: const Text(
                  'Add Water',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          RoundBlackButton(
            icon: Icons.calendar_month_rounded,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('History button pressed'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundBlackButton extends StatelessWidget {
  const RoundBlackButton({
    required this.icon,
    required this.onPressed,
    super.key,
  });

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 78,
      height: 78,
      child: IconButton.filled(
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        icon: Icon(
          icon,
          size: 29,
        ),
      ),
    );
  }
}


class AddWaterSheet extends StatefulWidget {
  const AddWaterSheet({super.key});

  @override
  State<AddWaterSheet> createState() => _AddWaterSheetState();
}

class _AddWaterSheetState extends State<AddWaterSheet> {
  String enteredAmount = '24';

  final List<WaterPreset> presets = [
    const WaterPreset(
      amount: 12,
      icon: Icons.coffee_rounded,
    ),
    const WaterPreset(
      amount: 16,
      icon: Icons.local_drink_rounded,
    ),
    const WaterPreset(
      amount: 20,
      icon: Icons.local_cafe_rounded,
    ),
    WaterPreset(
      amount: 24,
      icon: Icons.water_drop,
    ),
    const WaterPreset(
      amount: 30,
      icon: Icons.sports_bar_rounded,
    ),
  ];

  int get amount => int.tryParse(enteredAmount) ?? 0;

  void selectPreset(int value) {
    setState(() {
      enteredAmount = value.toString();
    });
  }

  void enterNumber(String number) {
    setState(() {
      if (enteredAmount == '0') {
        enteredAmount = number;
      } else if (enteredAmount.length < 3) {
        enteredAmount += number;
      }
    });
  }

  void deleteNumber() {
    setState(() {
      if (enteredAmount.length <= 1) {
        enteredAmount = '0';
      } else {
        enteredAmount = enteredAmount.substring(
          0,
          enteredAmount.length - 1,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.paddingOf(context).bottom;

    return SafeArea(
      top: false,
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.73,
        decoration: const BoxDecoration(
          color: Color(0xFFDCEBFF),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(42),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(28, 26, 28, 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(42),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          'Add Water',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const SizedBox(width: 85),
                    ],
                  ),
                  const SizedBox(height: 45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        enteredAmount,
                        style: const TextStyle(
                          fontSize: 58,
                          height: 1,
                          fontWeight: FontWeight.w900,
                          letterSpacing: -2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8, bottom: 3),
                        child: Text(
                          'oz',
                          style: TextStyle(
                            fontSize: 52,
                            height: 1,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(
                  24,
                  24,
                  24,
                  bottomPadding + 18,
                ),
                child: Column(
                  children: [
                    _buildPresets(),
                    const SizedBox(height: 30),
                    _buildNumberPad(),
                    const SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      height: 68,
                      child: FilledButton(
                        onPressed: amount > 0
                            ? () {
                                Navigator.pop(context, amount);
                              }
                            : null,
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          disabledBackgroundColor: Colors.black26,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: Text(
                          'Add $amount oz',
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPresets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: presets.map((preset) {
        final bool selected = amount == preset.amount;

        return GestureDetector(
          onTap: () => selectPreset(preset.amount),
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: selected
                      ? const Color(0xFFB6D7FF)
                      : Colors.white,
                  shape: BoxShape.circle,
                  border: selected
                      ? Border.all(
                          color: Colors.black,
                          width: 2,
                        )
                      : null,
                ),
                child: Icon(
                  preset.icon,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 9),
              Text(
                '${preset.amount}oz',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight:
                      selected ? FontWeight.w900 : FontWeight.w700,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNumberPad() {
    const keys = [
      '7',
      '8',
      '9',
      '4',
      '5',
      '6',
      '1',
      '2',
      '3',
      '00',
      '0',
      'delete',
    ];

    return GridView.builder(
      itemCount: keys.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 14,
        crossAxisSpacing: 14,
        childAspectRatio: 1.55,
      ),
      itemBuilder: (context, index) {
        final keyValue = keys[index];

        return Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(27),
          child: InkWell(
            borderRadius: BorderRadius.circular(27),
            onTap: () {
              if (keyValue == 'delete') {
                deleteNumber();
              } else if (keyValue == '00') {
                enterNumber('0');
                enterNumber('0');
              } else {
                enterNumber(keyValue);
              }
            },
            child: Center(
              child: keyValue == 'delete'
                  ? const Icon(
                      Icons.backspace_rounded,
                      size: 27,
                    )
                  : Text(
                      keyValue,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

class WaterPreset {
  const WaterPreset({
    required this.amount,
    required this.icon,
  });

  final int amount;
  final IconData icon;
}