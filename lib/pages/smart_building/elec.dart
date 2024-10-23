import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Elec extends StatelessWidget {
  const Elec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //untuk arrow back
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            SizedBox(
              width: 40.0,
              height: 40.0,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 8.0),
            const Text(
              'Ruang 1',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 30.0,
            ),
            child: Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: const [
                ElecCard(
                  icon: Icons.door_front_door,
                  title: "Pintu Depan",
                  desc: "Pintu Kayu Jati",
                  textOn: "unlocked",
                  textOff: "locked",
                ),
                ElecCard(
                  icon: Icons.ac_unit,
                  title: "Air Conditioner",
                  desc: "AC Polytron",
                  textOn: "on",
                  textOff: "off",
                ),
                ElecCard(
                  icon: Icons.lightbulb,
                  title: "Lampu depan",
                  desc: "Lampu LED",
                  textOn: "on",
                  textOff: "off",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ElecCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String desc;
  final String textOn;
  final String textOff;

  const ElecCard({
    super.key,
    required this.icon,
    required this.title,
    required this.desc,
    required this.textOn,
    required this.textOff,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ElecCardState createState() => _ElecCardState();
}

class _ElecCardState extends State<ElecCard> {
  bool isOn = true; // Default state for switch

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Card(
        color: isOn ? Colors.blue : Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                size: 55.0,
                color: isOn ? Colors.white : Colors.grey.shade400,
              ),
              const SizedBox(height: 5),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: isOn ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 7),
              Text(
                widget.desc,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isOn ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LiteRollingSwitch(
                    value: isOn,
                    textOn: widget.textOn,
                    textOff: widget.textOff,
                    colorOn: Colors.green,
                    colorOff: Colors.red,
                    iconOn: Icons.check,
                    iconOff: Icons.power_settings_new,
                    animationDuration: const Duration(milliseconds: 300),
                    onChanged: (bool state) {
                      setState(() {
                        isOn = state;
                      });
                    },
                    onDoubleTap: () {},
                    onSwipe: () {},
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
